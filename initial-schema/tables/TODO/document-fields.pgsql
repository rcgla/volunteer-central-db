create table rcglavc."DocumentFields" (
    "id" serial primary key,
    "name" text not null,
    "label" text,
    "length" integer,
    "field_type_id" integer not null,
    "custom_field_type_id" integer,
    foreign key ("custom_field_type_id") references rcglavc."CustomDocumentFields"("id")
);

comment on rcglavc."DocumentFields" is 'Different fields for use in document templates';