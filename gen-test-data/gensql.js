let LOGIN_SQL = login => `insert into rcglavc."Logins"("id", "email", "password", "type") 
    values 
    (${login.id}, $$${login.email}$$, crypt('${login.password}', gen_salt('bf')), $$${login.type}$$ );`;

let USER_SQL = (user, login_id) => `insert into 
    rcglavc."Users"("id", "login_id", "name", "address", "phone", 
        "allergies", "tshirt_size", "meal_pref", "emergency_contact_1", "emergency_contact_2", 
        "bio", "photo_url")
    values
    (${user.id}, ${login_id}, $$${user.name}$$, $$${user.address}$$, 
        $$${user.phone}$$, $$${user.allergies}$$, $$${user.tshirt_size}$$, $$${user.meal_pref}$$, 
        $$${user.emergency_contact_1}$$, $$${user.emergency_contact_2}$$, 
        $$${user.bio}$$, $$${user.photo_url}$$);`;

let SESSION_SQL = session => `insert into 
    rcglavc."Sessions"("id", "name", "start", "end") values 
    (${session.id}, $$${session.name}$$, $$${session.start.toISOString()}$$, $$${session.end.toISOString()}$$);`;

let ROLE_SQL = role => `insert into 
    rcglavc."Roles"("id", "name") 
    values(${role.id}, $$${role.name}$$);`;

let ROLE_GROUP_SQL = roleGroup => `insert into 
    rcglavc."RoleGroups"("id", "name") 
    values(${roleGroup.id}, $$${roleGroup.name}$$);`;

let ROLES_IN_ROLE_GROUPS_SQL = entry => `insert into 
    rcglavc."RolesInRoleGroups"("id", "role_id", "role_group_id")
    values (${entry.id}, ${entry.role_id}, ${entry.role_group_id});`;

let PARTICIPATION_SQL = entry => `insert into 
    rcglavc."Participation"("id", "user_id", "session_id", "role_id", "start", "end")
    values (${entry.id}, ${entry.user_id}, ${entry.session_id}, ${entry.role_id}, 
        $$${entry.start.toISOString()}$$, $$${entry.end.toISOString()}$$);`;    

module.exports = {
    LOGIN_SQL,
    USER_SQL,
    SESSION_SQL,
    ROLE_SQL,
    ROLE_GROUP_SQL,
    ROLES_IN_ROLE_GROUPS_SQL,
    PARTICIPATION_SQL
}