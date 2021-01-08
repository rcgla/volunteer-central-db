create table rcglavc."EventsLocations" (
    "id" serial primary key,
    "event_id" integer not null,
    "location_id" integer not null,
    foreign key ("event_id") references rcglavc."Events"("id"),
    foreign key ("location_id") references rcglavc."Locations"("id")
);
comment on table rcglavc."EventsLocations" is 'Events and their locations';

comment on constraint "EventsLocations_event_id_fkey" on rcglavc."EventsLocations" is E'@manyToManySimpleFieldName events';
comment on constraint "EventsLocations_location_id_fkey" on rcglavc."EventsLocations" is E'@manyToManySimpleFieldName locations';
