-- create type rcglavc.transport_type as enum ('TRUSTED_PARTY', 'PUBLIC_TRANSIT', 'DRIVES_SELF', 'RIDESHARE');
-- create type rcglavc.waiver_type as enum ('MEDIA', 'LIABILITY', 'MEDICAL', 'COC', 'FREEDOM_OF_EXPRESSION', 'PICKUP_PERMISSION', 'OTHER');
-- create type rcglavc.application_field_type as enum ('TEXT', 'NUMBER', 'DATETIME', 'BOOLEAN');

create type rcglavc.document_field_type as enum ('TEXT', 'NUMBER', 'DATETIME', 'BOOLEAN', 'CUSTOM');
create table rcglavc."DocumentFieldTypes" (
    "id" serial primary key,
    "name" text not null
    "type" rcglavc.document_field_type
);
comment on table rcglavc."DocumentFieldTypes" is 'Available types of fields';