-- admins can control all records
create policy rcglavc_admin_Photos
    on rcglavc."Photos" 
    to rcglavc_admin_role
    using(true);

-- staff can view all records
grant select on rcglavc."Photos" to rcglavc_staff_role;
create policy rcglavc_staff_Photos
    on rcglavc."Photos" 
    to rcglavc_staff_role
    using(true);

-- clients can view their own records
grant select on rcglavc."Photos" to rcglavc_client_role;
create policy rcglavc_client_Photos
    on rcglavc."Photos"
    to rcglavc_client_role
    using (rcglavc."Photos"."user_id" = rcglavc.current_user_id());
