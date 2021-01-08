-- admins can control all records
create policy rcglavc_admin_UsersProtectedInfo
    on rcglavc."UsersProtectedInfo" 
    to rcglavc_admin_role
    using(true);

-- staff can view records
grant select on rcglavc."UsersProtectedInfo" to rcglavc_staff_role;
create policy rcglavc_staff_UsersProtectedInfo
    on rcglavc."UsersProtectedInfo" 
    to rcglavc_staff_role
    using(true);

-- clients can view and update their own records
grant select, update on rcglavc."UsersProtectedInfo" to rcglavc_client_role;
create policy rcglavc_client_UsersProtectedInfo
    on rcglavc."UsersProtectedInfo"
    to rcglavc_client_role
    using (
        exists(
            select "users_protected_info_id", "id" 
            from rcglavc."Users"
            where rcglavc."Users"."id" = rcglavc.current_user_id()
            and
            rcglavc."Users"."users_protected_info_id" = rcglavc."UsersProtectedInfo"."id"
        )
    );

