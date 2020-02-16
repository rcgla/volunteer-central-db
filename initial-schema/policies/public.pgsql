\c :dbname;
drop role if exists rcglavc_public_role;
create role rcglavc_public_role;
alter default privileges revoke execute on functions from rcglavc_public_role;

grant usage on schema rcglavc to rcglavc_public_role;

grant rcglavc_public_role to rcglavc_app_role;

revoke all on rcglavc."CamperGroups" from rcglavc_public_role;
revoke all on rcglavc."Logins" from rcglavc_public_role;
revoke all on rcglavc."Participation" from rcglavc_public_role;
revoke all on rcglavc."Pickup" from rcglavc_public_role;
revoke all on rcglavc."Roles" from rcglavc_public_role;
revoke all on rcglavc."RoleGroups" from rcglavc_public_role;
revoke all on rcglavc."RolesInRoleGroups" from rcglavc_public_role;
revoke all on rcglavc."Schedule" from rcglavc_public_role;
revoke all on rcglavc."Sessions" from rcglavc_public_role;
revoke all on rcglavc."Tuition" from rcglavc_public_role;
revoke all on rcglavc."Users" from rcglavc_public_role;
revoke all on rcglavc."UserAvailability" from rcglavc_public_role;
revoke all on rcglavc."UsersInCamperGroups" from rcglavc_public_role;
revoke all on rcglavc."Waivers" from rcglavc_public_role;
revoke all on rcglavc."Years" from rcglavc_public_role;
