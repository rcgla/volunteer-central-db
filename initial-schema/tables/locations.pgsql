create table rcglavc."Locations" (
    "id" serial primary key,
    "name" text,
    "desc" text
);
comment on table rcglavc."Locations" is 'Site locations';
