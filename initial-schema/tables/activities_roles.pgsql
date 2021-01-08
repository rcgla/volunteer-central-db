create table rcglavc."ActivitiesRoles"(
    "id" serial primary key,
    "activity_id" integer not null,
    "role_id" integer not null,
    foreign key("activity_id") references rcglavc."Activities"("id"),
    foreign key("role_id") references rcglavc."Roles"("id")
);
comment on table rcglavc."ActivitiesRoles" is 'Many to many relationship between roles and activities';

comment on constraint "ActivitiesRoles_role_id_fkey" on rcglavc."ActivitiesRoles" is E'@manyToManySimpleFieldName roles';
comment on constraint "ActivitiesRoles_activity_id_fkey" on rcglavc."ActivitiesRoles" is E'@manyToManySimpleFieldName activities';