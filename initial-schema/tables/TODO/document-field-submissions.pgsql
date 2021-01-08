create table rcglavc."DocumentFieldSubmissions" (
    "id" serial primary key,
    "value" text,
    "document_submission_id" integer not null,
    "document_field_id" integer not null,
    foreign key ("document_submission_id") references rcglavc."DocumentSubmissions"("id"),
    foreign key ("document_field_id") references rcglavc."DocumentFields"("id")
);

comment on rcglavc."DocumentFieldSubmissions" is 'Field values for a submitted document';

alter table rcglavc."DocumentFieldSubmissions" enable row level security;
