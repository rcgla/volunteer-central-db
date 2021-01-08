create table rcglavc."PickupAuthorizations" (
    "id" serial primary key,
    "user_id" integer not null,
    "transport_type" rcglavc.transport_type default 'TRUSTED_PARTY',
    "start" timestamptz not null,
    "notes" text,
    foreign key ("user_id") references rcglavc."Users"("id")
);
comment on table rcglavc."PickupAuthorizations" is 'Camper pickup authorizations';
