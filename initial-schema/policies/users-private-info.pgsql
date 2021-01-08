-- admins can control all records
create policy rcglavc_admin_UsersPrivateInfo
    on rcglavc."UsersPrivateInfo" 
    to rcglavc_admin_role
    using(true);

-- clients can view and update their own records
grant select, update on rcglavc."UsersPrivateInfo" to rcglavc_client_role;
create policy rcglavc_client_UsersPrivateInfo
    on rcglavc."UsersPrivateInfo"
    to rcglavc_client_role
    using (
        exists(
            select "users_private_info_id", "id" 
            from rcglavc."Users"
            where rcglavc."Users"."id" = rcglavc.current_user_id()
            and
            rcglavc."Users"."users_private_info_id" = rcglavc."UsersPrivateInfo"."id"
        )
    );

