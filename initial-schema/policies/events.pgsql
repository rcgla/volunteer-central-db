-- admins can control all records
create policy rcglavc_admin_Events
    on rcglavc."Events" 
    to rcglavc_admin_role
    using(true);

grant select on table rcglavc."Events" to rcglavc_client_role;

create policy rcglavc_client_Events
    on rcglavc."Events"
    to rcglavc_client_role
    using(rcglavc."Events"."visibility" = 'CLIENT');

create policy rcglavc_staff_Events
    on rcglavc."Events"
    to rcglavc_staff_role
    using(rcglavc."Events"."visibility" = 'STAFF');
