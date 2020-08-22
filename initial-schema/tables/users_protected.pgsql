create table rcglavc."UsersProtected" (
    "id" serial primary key,
    "user_id" integer not null,
    "phone" text,
    "address" text,
    "bio" text,
    foreign key ("user_id") references rcglavc."Users"("id")
);
comment on table rcglavc."UsersProtected" is 'Restricted access to this info';
