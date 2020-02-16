\c :dbname;

drop role if exists rcglavc_app_role;
create role rcglavc_app_role with LOGIN password :'appRolePassword';

grant usage on schema rcglavc to rcglavc_app_role;
grant execute on all functions in schema rcglavc to rcglavc_app_role;
grant select, update, insert, delete on all tables in schema rcglavc to rcglavc_app_role;
grant all privileges on database :dbname to rcglavc_app_role;
grant all privileges on all tables in schema rcglavc to rcglavc_app_role;

create policy rcglavc_app_CamperGroups
    on rcglavc."CamperGroups" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Logins
    on rcglavc."Logins" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Participation
    on rcglavc."Participation" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Pickup
    on rcglavc."Pickup" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Roles
    on rcglavc."Roles" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_RoleGroups
    on rcglavc."RoleGroups" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_RolesInRoleGroups
    on rcglavc."RolesInRoleGroups" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Schedule
    on rcglavc."Schedule" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Sessions
    on rcglavc."Sessions" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Tuition
    on rcglavc."Tuition" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Users
    on rcglavc."Users" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_UserAvailability
    on rcglavc."UserAvailability" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_UsersInCamperGroups
    on rcglavc."UsersInCamperGroups" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Waivers
    on rcglavc."Waivers" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Years
    on rcglavc."Years" 
    to rcglavc_app_role
    using(true);
