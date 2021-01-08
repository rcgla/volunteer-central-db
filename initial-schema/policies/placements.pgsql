-- admins can control all records
create policy rcglavc_admin_Placements
    on rcglavc."Placements" 
    to rcglavc_admin_role
    using(true);

-- staff can view all records
grant select on rcglavc."Placements" to rcglavc_staff_role;
create policy rcglavc_staff_Placements
    on rcglavc."Placements" 
    to rcglavc_staff_role
    using(true);

-- clients can view their own records
grant select on rcglavc."Placements" to rcglavc_client_role;
create policy rcglavc_client_Placements
    on rcglavc."Placements"
    to rcglavc_client_role
    using (rcglavc."Placements"."user_id" = rcglavc.current_user_id());
