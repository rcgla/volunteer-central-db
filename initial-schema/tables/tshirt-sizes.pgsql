create table rcglavc."TShirtSizes" (
    "id" serial primary key,
    "name" text,
    "order" integer not null
);
comment on column rcglavc."TShirtSizes"."order" is 'Smaller number means smaller size';
