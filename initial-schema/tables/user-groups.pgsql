create table rcglavc."UserGroups" (
    "id" serial primary key,
    "name" text not null,
    "event_id" integer not null,
    "track_id" integer,
    "user_group_type_id" integer,
    foreign key ("event_id") references rcglavc."Events"("id"),
    foreign key ("track_id") references rcglavc."Tracks"("id"),
    foreign key ("user_group_type_id") references rcglavc."UserGroupTypes"("id")
);
comment on table rcglavc."UserGroups" is 'Examples of UserGroups: Bands, crews, or zoom huddles';
