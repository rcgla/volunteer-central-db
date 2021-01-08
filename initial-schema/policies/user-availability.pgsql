-- admins can control all records
create policy rcglavc_admin_UserAvailability
    on rcglavc."UserAvailability" 
    to rcglavc_admin_role
    using(true);

-- staff can view records
grant select on rcglavc."UserAvailability" to rcglavc_staff_role;
create policy rcglavc_staff_UserAvailability_select
    on rcglavc."UserAvailability" 
    to rcglavc_staff_role
    using(true);

-- staff can update their own records
grant select, update on rcglavc."UserAvailability" to rcglavc_staff_role;
create policy rcglavc_staff_UserAvailability_update
    on rcglavc."UserAvailability"
    to rcglavc_staff_role
    using (rcglavc."UserAvailability"."user_id" = rcglavc.current_user_id());