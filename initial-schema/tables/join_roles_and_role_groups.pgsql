create table rcglavc."JoinRolesAndRoleGroups" (
    "id" serial primary key,
    "role_id" integer not null,
    "role_group_id" integer not null,
    foreign key ("role_id") references rcglavc."Roles"("id"),
    foreign key ("role_group_id") references rcglavc."RoleGroups"("id")
);
