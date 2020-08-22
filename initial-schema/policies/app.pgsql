\c :dbname;



create policy rcglavc_app_JoinCamperGroupsAndScheduleEntries
    on rcglavc."JoinCamperGroupsAndScheduleEntries" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_EmergencyContacts
    on rcglavc."EmergencyContacts"
    to rcglavc_app_role
    using (true);

create policy rcglavc_app_Invitations
    on rcglavc."Invitations" 
    to rcglavc_app_role
    using (true);

create policy rcglavc_app_Logins
    on rcglavc."Logins" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_PickupAuthorizations
    on rcglavc."PickupAuthorizations" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_RoleGroups
    on rcglavc."RoleGroups" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Roles
    on rcglavc."Roles" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_RolesInRoleGroups
    on rcglavc."RolesInRoleGroups" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_ScheduleEntries
    on rcglavc."ScheduleEntries" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Sessions
    on rcglavc."Sessions" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Placements
    on rcglavc."Placements" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Tuition
    on rcglavc."Tuition" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_UserAvailability
    on rcglavc."UserAvailability" 
    to rcglavc_app_role
    using(true);

create policy rcglavc_app_Users
    on rcglavc."Users" 
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

