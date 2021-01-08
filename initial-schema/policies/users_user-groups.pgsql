-- admins can control all records
create policy rcglavc_admin_UsersUserGroups
    on rcglavc."UsersUserGroups" 
    to rcglavc_admin_role
    using(true);

-- staff can view records
grant select on rcglavc."UsersUserGroups" to rcglavc_staff_role;
create policy rcglavc_staff_UsersUserGroups
    on rcglavc."UsersUserGroups" 
    to rcglavc_staff_role
    using(true);

-- clients can view their own records
grant select on rcglavc."UsersUserGroups" to rcglavc_client_role;
create policy rcglavc_client_UsersUserGroups
    on rcglavc."UsersUserGroups"
    to rcglavc_client_role
    using (rcglavc."UsersUserGroups"."user_id" = current_user_id());
