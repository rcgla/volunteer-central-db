create table rcglavc."Activities" (
    "id" serial primary key,
    "name" text not null,
    "description" text,
    "notes" text,
    "start" timestamptz not null,
    "end" timestamptz not null,
    "repeat" boolean default 'f',
    "visibility" rcglavc.user_type default 'STAFF',
    "restrictVisibility" boolean default 'f',
    "activity_type_id" integer,
    "event_id" integer,
    "location_id" integer,
    "track_id" integer,
    foreign key ("event_id") references rcglavc."Events"("id"),
    foreign key ("location_id") references rcglavc."Locations"("id"),
    foreign key ("track_id") references rcglavc."Tracks"("id"),
    foreign key ("activity_type_id") references rcglavc."ActivityTypes"("id")
);
comment on table rcglavc."Activities" is 'Scheduled activities for camp and special events';

comment on constraint "Activities_event_id_fkey" on rcglavc."Activities" is
  E'@foreignFieldName activities';

alter table rcglavc."Activities" enable row level security;