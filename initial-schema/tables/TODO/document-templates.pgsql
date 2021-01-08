create table rcglavc."Documents" (
    "id" serial primary key,
    "description" text,
    "is_user_facing" boolean default false
);

comment on table rcglavc."Documents" is 'A document is a set of fields that can be internal or user-facing, such as an application or media waiver or pickup authorization';