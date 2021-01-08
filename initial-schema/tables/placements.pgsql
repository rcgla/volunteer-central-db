create table rcglavc."Placements" (
    "id" serial primary key,
    "user_id" integer not null, 
    "event_id" integer,
    "role_id" integer not null,
    "confirmed" boolean default 'f',
    "dropped" boolean default 'f',
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("event_id") references rcglavc."Events"("id"),
    foreign key ("role_id") references rcglavc."Roles"("id")

);
comment on table rcglavc."Placements" is 'Users and their roles for events (or year-round roles)';

alter table rcglavc."Placements" enable row level security;

comment on constraint "Placements_event_id_fkey" on rcglavc."Placements" is
  E'@foreignFieldName placements';

comment on constraint "Placements_user_id_fkey" on rcglavc."Placements" is
  E'@foreignFieldName placements';

