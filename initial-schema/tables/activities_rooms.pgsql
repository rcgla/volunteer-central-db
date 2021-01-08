create table rcglavc."ActivitiesRooms" (
    "id" serial primary key,
    "room_id" integer not null,
    "activity_id" integer not null,
    foreign key ("room_id") references rcglavc."Rooms"("id"),
    foreign key ("activity_id") references rcglavc."Activities"("id")
);
comment on table rcglavc."ActivitiesRooms" is 'Many to many relationship between activities and rooms';

comment on constraint "ActivitiesRooms_room_id_fkey" on rcglavc."ActivitiesRooms" is E'@manyToManySimpleFieldName rooms';
comment on constraint "ActivitiesRooms_activity_id_fkey" on rcglavc."ActivitiesRooms" is E'@manyToManySimpleFieldName activities';