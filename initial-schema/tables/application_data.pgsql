create table rcglavc."ApplicationData" (
    "id" serial primary key,
    "user_id" integer not null,
    "field_id" integer not null,
    "value" text,
    foreign key ("field_id") references rcglavc."ApplicationFields"("id"),
    foreign key ("user_id") references rcglavc."Users"("id")
);
