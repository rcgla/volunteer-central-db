create table rcglavc."Rooms" (
    "id" serial primary key,
    "name" text,
    "desc" text,
    "location_id" integer not null,
    foreign key ("location_id") references rcglavc."Locations"("id")
);
comment on table rcglavc."Rooms" is 'Locations for schedule entries';
