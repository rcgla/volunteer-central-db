create table rcglavc."ActivityTypes" (
    "id" serial primary key,
    "name" text
);

comment on table rcglavc."ActivityTypes" is 'Different types of activities, e.g. instruction class, workshop, showcase';