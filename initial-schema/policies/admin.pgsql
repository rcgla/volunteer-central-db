\c :dbname;
drop role if exists rcglavc_admin_role;
create role rcglavc_admin_role;

grant usage on schema rcglavc to rcglavc_admin_role;
grant select, update, insert, delete on all tables in schema rcglavc to rcglavc_admin_role;

grant all on all sequences in schema rcglavc to rcglavc_admin_role;

grant rcglavc_admin_role to rcglavc_app_role;

create policy rcglavc_admin_CamperGroups
    on rcglavc."CamperGroups" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Logins
    on rcglavc."Logins" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Participation
    on rcglavc."Participation" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Pickup
    on rcglavc."Pickup" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Roles
    on rcglavc."Roles" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_RoleGroups
    on rcglavc."RoleGroups" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_RolesInRoleGroups
    on rcglavc."RolesInRoleGroups" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Schedule
    on rcglavc."Schedule" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Sessions
    on rcglavc."Sessions" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Tuition
    on rcglavc."Tuition" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Users
    on rcglavc."Users" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_UserAvailability
    on rcglavc."UserAvailability" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_UsersInCamperGroups
    on rcglavc."UsersInCamperGroups" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Waivers
    on rcglavc."Waivers" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Years
    on rcglavc."Years" 
    to rcglavc_admin_role
    using(true);
