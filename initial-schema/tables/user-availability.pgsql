create table rcglavc."UserAvailability" (
    "id" serial primary key,
    "user_id" integer not null,
    "event_id" integer not null,
    "start" timestamptz not null,
    "end" timestamptz not null,
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("event_id") references rcglavc."Events"("id")
);
comment on table rcglavc."UserAvailability" is 'User schedules';

comment on constraint "UserAvailability_user_id_fkey" on rcglavc."UserAvailability" is
  E'@foreignFieldName userAvailabilities';

comment on constraint "UserAvailability_event_id_fkey" on rcglavc."UserAvailability" is
  E'@foreignFieldName userAvailabilities';