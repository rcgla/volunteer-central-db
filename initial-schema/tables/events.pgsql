create table rcglavc."Events" (
    "id" serial primary key,
    "name" text not null,
    "event_type_id" integer not null,
    "description" text,
    "visibility" rcglavc.user_type default 'STAFF',
    "start" timestamptz not null,
    "end" timestamptz not null,
    foreign key("event_type_id") references rcglavc."EventTypes"("id")
);
comment on table rcglavc."Events" is 'Events are large happenings, not specific activities. Examples of events are camp sessions or fundraisers';

alter table rcglavc."Events" enable row level security;
