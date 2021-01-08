create table rcglavc."Locations" (
    "id" serial primary key,
    "name" text,
    "description" text,
    "address" text,
    "notes" text
);
comment on table rcglavc."Locations" is 'Site locations';
