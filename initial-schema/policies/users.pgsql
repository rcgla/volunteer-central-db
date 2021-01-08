create policy rcglavc_admin_Users
    on rcglavc."Users" 
    to rcglavc_admin_role
    using(true);

grant select on rcglavc."Users" to rcglavc_client_role;
create policy rcglavc_client_Users_select
    on rcglavc."Users"
    for select
    to rcglavc_client_role
    using(true);

grant update on rcglavc."Users" to rcglavc_client_role;
create policy rcglavc_client_Users_update
    on rcglavc."Users"
    for update
    to rcglavc_client_role
    using (rcglavc."Users"."id" = rcglavc.current_user_id());

