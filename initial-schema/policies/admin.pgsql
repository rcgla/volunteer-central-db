\c :dbname;



create policy rcglavc_admin_JoinCamperGroupsAndScheduleEntries
    on rcglavc."JoinCamperGroupsAndScheduleEntries" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_app_EmergencyContacts
    on rcglavc."EmergencyContacts"
    to rcglavc_admin_role
    using (true);

create policy rcglavc_admin_Invitations
    on rcglavc."Invitations" 
    to rcglavc_admin_role
    using (true);

create policy rcglavc_admin_Logins
    on rcglavc."Logins" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_PickupAuthorizations
    on rcglavc."PickupAuthorizations" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_RoleGroups
    on rcglavc."RoleGroups" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Roles
    on rcglavc."Roles" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_RolesInRoleGroups
    on rcglavc."RolesInRoleGroups" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_ScheduleEntries
    on rcglavc."ScheduleEntries" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Sessions
    on rcglavc."Sessions" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Placements
    on rcglavc."Placements" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Tuition
    on rcglavc."Tuition" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_UserAvailability
    on rcglavc."UserAvailability" 
    to rcglavc_admin_role
    using(true);

create policy rcglavc_admin_Users
    on rcglavc."Users" 
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
