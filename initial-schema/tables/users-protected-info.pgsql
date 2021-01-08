create table rcglavc."UsersProtectedInfo" (
    "id" serial primary key,
    "food_allergies" text,
    "medical" text,
    "t_shirt_size_id" integer,
    "meal_pref"	rcglavc.meal_type default 'OMNIVORE',
    "handed" rcglavc.handed_type default 'RIGHT',
    foreign key ("t_shirt_size_id") references rcglavc."TShirtSizes"("id")
);
comment on table rcglavc."UsersProtectedInfo" is 'Access to this table is restricted to staff';

alter table rcglavc."UsersProtectedInfo" enable row level security;