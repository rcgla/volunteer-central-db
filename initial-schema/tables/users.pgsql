create table rcglavc."Users" (
    "id" serial primary key,
    "login_id" integer not null,
    "users_private_info_id" integer,
    "users_protected_info_id" integer,
    "name" text,
    "user_type" rcglavc.user_type default 'CLIENT',
    foreign key ("login_id") references rcglavc."Logins"("id"),
    foreign key ("users_private_info_id") references rcglavc."UsersPrivateInfo"("id"),
    foreign key ("users_protected_info_id") references rcglavc."UsersProtectedInfo"("id")
);
comment on table rcglavc."Users" is 'User profile information';

alter table rcglavc."Users" enable row level security;
