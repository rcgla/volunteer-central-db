create table rcglavc."UsersInCamperGroups" (
    "id" serial primary key,
    "user_id" integer not null,
    "camper_group_id" integer not null,
    foreign key ("user_id") references rcglavc."Users"("id"),
    foreign key ("camper_group_id") references rcglavc."CamperGroups"("id")
);
comment on table rcglavc."UsersInCamperGroups" is 'Users in bands and crews and zoom huddles';
