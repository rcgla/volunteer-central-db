create table rcglavc."EmergencyContacts" (
    "id" serial primary key,
    "user_id" integer not null,
    "name" text not null,
    "phone" text,
    "relation" text,
    foreign key ("user_id") references rcglavc."Users"("id")
);
alter table rcglavc."EmergencyContacts" enable row level security;

comment on constraint "EmergencyContacts_user_id_fkey" on rcglavc."EmergencyContacts" is
  E'@foreignFieldName emergencyContacts';