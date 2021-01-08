-- admins can control all records
create policy rcglavc_admin_Activities
    on rcglavc."Activities" 
    to rcglavc_admin_role
    using(true);

grant select on table rcglavc."Activities" to rcglavc_client_role;

create policy rcglavc_client_Activities
    on rcglavc."Activities"
    to rcglavc_client_role
    using(rcglavc."Activities"."visibility" = 'CLIENT');

create policy rcglavc_staff_Activities
    on rcglavc."Activities"
    to rcglavc_staff_role
    using(rcglavc."Activities"."visibility" = 'STAFF');

