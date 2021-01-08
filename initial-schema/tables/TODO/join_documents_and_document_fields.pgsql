create table rcglavc."JoinDocumentsAndDocumentFields" (
    "id" serial primary key,
    "document_field_id" integer not null,
    "document_id" integer not null,
    foreign key ("document_field_id") references rcglavc."DocumentFields"("id"),
    foreign key ("document_id") references rcglavc."Documents"("id")
);
comment on table rcglavc."JoinDocumentsAndDocumentFields" is 'Define a document as a set of fields';
