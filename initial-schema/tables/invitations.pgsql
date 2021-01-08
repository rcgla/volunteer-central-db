create table rcglavc."Invitations" (
    "id" serial primary key,
    "user_id" integer not null,
    "date_invited" timestamptz default current_timestamp,
    foreign key ("user_id") references rcglavc."Users"("id")
);

comment on table rcglavc."Invitations" is 'Invitation to use the website';

alter table rcglavc."Invitations" enable row level security;
