create table rcglavc."DocumentFieldTypeCustomValues" (
    "id" serial primary key,
    "name" text not null,
    "document_field_type_id" integer not null,
    foreign key ("document_field_type_id") references rcglavc."DocumentFieldTypes"("id")
);
comment on table rcglavc."DocumentFiledTypeCustomValues" is 'Each entry is an enum value option for a custom field type';