create table rcglavc."Roles" (
    "id" serial primary key,
    "name" text not null
);
comment on table rcglavc."Roles" is 'Roles at camp and year-round';
