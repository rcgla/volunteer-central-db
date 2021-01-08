create table rcglavc."EventTypes" (
    "id" serial primary key,
    "name" text
);

comment on table rcglavc."EventTypes" is 'Different types of events, eg. camp session or LRC or fundraiser';