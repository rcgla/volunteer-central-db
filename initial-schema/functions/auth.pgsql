\c :dbname;

create extension if not exists pgcrypto;

-- Function: current_user_id
-- jwt data comes via postgraphile
create or replace function rcglavc.current_user_id() returns integer as $$
  select nullif(current_setting('jwt.claims.user_id', true), '')::integer;
$$ language sql stable;


-- Function: authenticate
create or replace function rcglavc.authenticate(
    email text,
    password text
)
returns rcglavc.jwt_token as $$
declare 
    usr rcglavc."Users";
    login rcglavc."Logins";
    userrole text;
begin
    select a.* into login
        from rcglavc."Logins" as a
        where a.email = authenticate.email;
    if found then 
        if login.password = crypt(authenticate.password, login.password) then
            select a.* into usr
                from rcglavc."Users" as a
                where a.login_id = login.id;
            if usr.type = 'ADMIN' then
                userrole := 'rcglavc_admin_role';
            elsif usr.type = 'STAFF' then
                userrole := 'rcglavc_staff_role';
            else
                userrole := 'rcglavc_client_role';
            end if;
            if login.active then 
                update rcglavc."Logins" 
                    set last_seen = current_timestamp 
                    where id = login.id;
                return (
                    userrole,
                    extract(epoch from now() + interval '7 days'),
                    usr.id
                )::rcglavc.jwt_token;
            end if;
        end if;
    end if;
    return null;
end;
$$ language plpgsql VOLATILE strict security definer;

-- Function: create_temporary_token
-- access to this function should be restricted to admins
-- this token will grant user-level access for 1 hour
-- the user must already be in the "Users" table and they also must have an entry
-- in "Logins" with suggested values of {type: 'USER', active: 'f', password: ''}
create or replace function rcglavc.create_temporary_token(
    email text
)
returns rcglavc.jwt_token as $$
declare 
    usr rcglavc."Users";
    login rcglavc."Logins";
    userrole text;
begin
    select a.* into login
        from rcglavc."Logins" as a
        where a.email = create_temporary_token.email;
    
    if found then
        select a.* into usr
            from rcglavc."Users" as a
            where a.login_id = login.id;
        
        if usr.type = 'ADMIN' then
            userrole := 'rcglavc_admin_role';
        elsif usr.type = 'STAFF' then
            userrole := 'rcglavc_staff_role';
        else
            userrole := 'rcglavc_client_role';
        end if;
        return (
            userrole,
            extract(epoch from now() + interval '1 hour'),
            usr.id
        )::rcglavc.jwt_token;
    else
        return null;
    end if;
end;
$$ language plpgsql VOLATILE strict security definer;

-- Function: set password
create or replace function rcglavc.set_password(
    user_id integer,
    new_password text
)
returns boolean as $$
declare 
    usr rcglavc."Users";
    login rcglavc."Logins";
begin
    select a.* into usr
        from rcglavc."Users" as a
        where a.id = user_id;
    
    if found then
        select a.* into login
            from rcglavc."Logins" as a
            where a.id = usr.login_id;

            update rcglavc."Logins" set password=crypt(new_password, gen_salt('bf'))
            where rcglavc."Logins"."id" = login.id;
            return true;
    else
        return false;
    end if;
    
end;
$$ language plpgsql VOLATILE strict security definer;
