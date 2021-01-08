create table rcglavc."ActivitiesUserGroups"(
    "id" serial primary key,
    "activity_id" integer not null,
    "user_group_id" integer not null,
    foreign key("activity_id") references rcglavc."Activities"("id"),
    foreign key("user_group_id") references rcglavc."UserGroups"("id")
);
comment on table rcglavc."ActivitiesUserGroups" is 'Many to many relationship between user groups and activities';

comment on constraint "ActivitiesUserGroups_user_group_id_fkey" on rcglavc."ActivitiesUserGroups" is E'@manyToManySimpleFieldName userGroups';
comment on constraint "ActivitiesUserGroups_activity_id_fkey" on rcglavc."ActivitiesUserGroups" is E'@manyToManySimpleFieldName activities';