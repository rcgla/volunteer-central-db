-- admins can control all records
create policy rcglavc_admin_EmergencyContacts
    on rcglavc."EmergencyContacts" 
    to rcglavc_admin_role
    using(true);

-- clients can view and update their own records
grant select, update on rcglavc."EmergencyContacts" to rcglavc_client_role;
create policy rcglavc_client_EmergencyContacts
    on rcglavc."EmergencyContacts"
    to rcglavc_client_role
    using (rcglavc."EmergencyContacts"."user_id" = rcglavc.current_user_id());

