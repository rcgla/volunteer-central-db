create table rcglavc."CamperGroups" (
    "id" serial primary key,
    "name" text not null,
    "session_id" integer not null,
    "track_id" integer not null,
    foreign key ("session_id") references rcglavc."Sessions"("id"),
    foreign key ("track_id") references rcglavc."Tracks"("id")
);
comment on table rcglavc."CamperGroups" is 'Bands and crews and zoom huddles';
