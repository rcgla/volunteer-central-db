/* app role */
drop role if exists rcglavc_app_role;
create role rcglavc_app_role with LOGIN password :'appRolePassword';
grant usage on schema rcglavc to rcglavc_app_role;
grant execute on all functions in schema rcglavc to rcglavc_app_role;
grant select, update, insert, delete on all tables in schema rcglavc to rcglavc_app_role;
grant all on all sequences in schema rcglavc to rcglavc_app_role;
grant all privileges on database :dbname to rcglavc_app_role;
grant all privileges on all tables in schema rcglavc to rcglavc_app_role;

/* admin role */
drop role if exists rcglavc_admin_role;
create role rcglavc_admin_role;
grant usage on schema rcglavc to rcglavc_admin_role;
grant select, update, insert, delete on all tables in schema rcglavc to rcglavc_admin_role;
grant all on all sequences in schema rcglavc to rcglavc_admin_role;
grant rcglavc_admin_role to rcglavc_app_role;

/* staff role */
drop role if exists rcglavc_staff_role;
create role rcglavc_staff_role;


/* client role */
drop role if exists rcglavc_client_role;
create role rcglavc_client_role;


/* public role */
drop role if exists rcglavc_public_role;
create role rcglavc_public_role;
alter default privileges revoke execute on functions from rcglavc_public_role;
grant usage on schema rcglavc to rcglavc_public_role;
grant rcglavc_public_role to rcglavc_app_role;
