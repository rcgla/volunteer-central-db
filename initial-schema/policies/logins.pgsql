create policy rcglavc_admin_Logins
    on rcglavc."Logins" 
    to rcglavc_admin_role
    using(true);

grant select, update("password") on rcglavc."Logins" to rcglavc_client_role;
create policy rcglavc_client_Logins
    on rcglavc."Logins"
    to rcglavc_client_role
    using (
        exists(
            select "login_id", "id" 
            from rcglavc."Users"
            where rcglavc."Users"."id" = rcglavc.current_user_id()
            and
            rcglavc."Users"."login_id" = rcglavc."Logins"."id"
        )
    );
