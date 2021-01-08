create table rcglavc."Rooms" (
    "id" serial primary key,
    "name" text,
    "description" text,
    "location_id" integer not null,
    "notes" text,
    foreign key ("location_id") references rcglavc."Locations"("id")
);
comment on table rcglavc."Rooms" is 'Specific spots within locations';

comment on constraint "Rooms_location_id_fkey" on rcglavc."Rooms" is
  E'@foreignFieldName rooms';