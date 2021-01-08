create table rcglavc."Tracks" (
    "id" serial primary key,
    "event_id" integer not null,
    "track_type_id" integer not null,
    "description" text,
    "name" text,
    "start" timestamptz,
    "end" timestamptz,
    foreign key("event_id") references rcglavc."Events"("id"),
    foreign key("track_type_id") references rcglavc."TrackTypes"("id")
);
comment on table rcglavc."Tracks" is 'A track is a parallel set of activities within an event';

comment on constraint "Tracks_event_id_fkey" on rcglavc."Tracks" is
  E'@foreignFieldName tracks';