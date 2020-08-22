create table rcglavc."JoinCamperGroupsAndScheduleEntries" (
    "id" serial primary key,
    "camper_group_id" integer not null,
    "schedule_entry_id" integer not null,
    foreign key ("schedule_entry_id") references rcglavc."ScheduleEntries"("id"),
    foreign key ("camper_group_id") references rcglavc."CamperGroups"("id")
);
comment on table rcglavc."JoinCamperGroupsAndScheduleEntries" is 'Associates camper groups with scheduled activities';
