create table rcglavc."DocumentSubmissions" (
    "id" serial primary key,
    "document_template_id" integer not null,
    "user_id" integer,
    "submitted" boolean default 'f',
    "date_submitted" timestamptz,
    "notes" text,
    foreign key("document_id") references rcglavc."Documents"("id"),
    foreign key ("user_id") references rcglavc."Users"("id")
);

comment on table rcglavc."DocumentSubmissions" is 'A document submitted by a user or on their behalf';

alter table rcglavc."DocumentSubmissions" enable row level security;
