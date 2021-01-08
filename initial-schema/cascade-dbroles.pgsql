
grant rcglavc_public_role to rcglavc_client_role;
grant rcglavc_client_role to rcglavc_staff_role;
grant rcglavc_staff_role to rcglavc_admin_role;
grant rcglavc_admin_role to rcglavc_app_role;

-- just to be sure, disallow all public access on tables
revoke all on all tables in schema rcglavc from rcglavc_public_role;
