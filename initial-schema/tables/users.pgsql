create table rcglavc."Users" (
    "id" serial primary key,
    "login_id" integer not null,
    "name" text,
    "food_allergies" text,
    "medical" text,
    "tshirt_size_id" integer,
    "meal_pref"	rcglavc.meal_type default 'OMNIVORE',
    "type" rcglavc.user_type default 'CLIENT',
    foreign key ("login_id") references rcglavc."Logins"("id"),
    foreign key ("tshirt_size_id") references rcglavc."TShirtSizes"("id")
);
comment on table rcglavc."Users" is 'User profile information';
