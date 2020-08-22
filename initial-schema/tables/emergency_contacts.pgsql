create table rcglavc."EmergencyContacts" (
    "id" serial primary key,
    "user_id" integer not null,
    "name" text not null,
    "address" text,
    "phone" text,
    foreign key ("user_id") references rcglavc."Users"("id")
);
alter table rcglavc."EmergencyContacts" enable row level security;
