\c :dbname;

create extension if not exists pgcrypto;

-- Function: current_user_id
-- jwt data comes via postgraphile
create or replace function rcglavc.current_user_id() returns integer as $$
  select nullif(current_setting('jwt.claims.user_id', true), '')::integer;
$$ language sql stable;


-- Function: authenticate
create or replace function rcglavc.authenticate(
    username text,
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
        where a.username = authenticate.username;
    if found then 
        if login.password = crypt(authenticate.password, login.password) then
            select a.* into usr
                from rcglavc."Users" as a
                where a.login_id = login.id;
            if usr.user_type = 'ADMIN' then
                userrole := 'rcglavc_admin_role';
            elsif usr.user_type = 'STAFF' then
                userrole := 'rcglavc_staff_role';
            elsif usr.user_type = 'CLIENT' then
                userrole := 'rcglavc_client_role';
            else
                return null;
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
-- the user must already be in the "Users" table and they also must have an entry in "Logins"
create or replace function rcglavc.create_temporary_token(
    username text,
    duration text
)
returns rcglavc.jwt_token as $$
declare 
    usr rcglavc."Users";
    login rcglavc."Logins";
    userrole text;
begin
    select a.* into login
        from rcglavc."Logins" as a
        where a.username = create_temporary_token.username;
    
    if found then
        select a.* into usr
            from rcglavc."Users" as a
            where a.login_id = login.id;
        
        if usr.user_type = 'ADMIN' then
            userrole := 'rcglavc_admin_role';
        elsif usr.user_type = 'STAFF' then
            userrole := 'rcglavc_staff_role';
        elsif usr.user_type = 'CLIENT' then
            userrole := 'rcglavc_client_role';
        else
            return null;
        end if;
        return (
            userrole,
            extract(epoch from now() + (create_temporary_token.duration)::interval),
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

            -- also set the login as 'active'
            update rcglavc."Logins" set active=true 
            where rcglavc."Logins"."id" = login.id;
            return true;
    else
        return false;
    end if;
    
end;
$$ language plpgsql VOLATILE strict security definer;

create or replace function rcglavc.create_new_login(username text, pwd text, active boolean)
returns int
 as $$
declare
    new_id integer;
    login rcglavc."Logins";
begin
    select a.* into login
        from rcglavc."Logins" as a
        where a.username = create_new_login.username;
    if not found then 
        insert into rcglavc."Logins" ("username", "password", "active")
        values (create_new_login.username, crypt(create_new_login.pwd, gen_salt('bf')), active)
        returning "id" into new_id;
        return new_id;
    else 
        raise exception 'Username already exists %', create_new_login.username using hint = 'Please check the supplied username';
    end if;
end;
$$ language plpgsql volatile;
