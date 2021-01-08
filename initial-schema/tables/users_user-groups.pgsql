create table rcglavc."UsersUserGroups" (
    "id" serial primary key,
    "user_id" integer not null,
    "user_group_id" integer not null,
    foreign key("user_id") references rcglavc."Users"("id"),
    foreign key("user_group_id") references rcglavc."UserGroups"("id")
);
comment on table rcglavc."UsersUserGroups" is 'Many to many relationship between users and user groups';

alter table rcglavc."UsersUserGroups" enable row level security;

comment on constraint "UsersUserGroups_user_id_fkey" on rcglavc."UsersUserGroups" is E'@manyToManySimpleFieldName users';
comment on constraint "UsersUserGroups_user_group_id_fkey" on rcglavc."UsersUserGroups" is E'@manyToManySimpleFieldName userGroups';