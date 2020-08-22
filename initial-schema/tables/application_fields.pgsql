create table rcglavc."ApplicationFields" (
    "id" serial primary key,
    "name" text not null,
    "label" text,
    "type" rcglavc.application_field_type not null,
    "template_id" integer not null,
    foreign key ("template_id") references rcglavc."ApplicationTemplates"("id")
);
