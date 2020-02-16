const faker = require('faker');
const { masterListOfRoles } = require('./roles');
const {
    LOGIN_SQL,
    USER_SQL,
    SESSION_SQL,
    ROLE_SQL,
    ROLE_GROUP_SQL,
    ROLES_IN_ROLE_GROUPS_SQL,
    PARTICIPATION_SQL
} = require('./gensql');

const {
    randTShirtSize,
    randMealPref,
    randAllergies,
    randPhotoUrl,
    randRoles
} = require ('./randos');

const fs = require('fs');

/*
simple case: 
1 session
30 campers, each with a unique login (e.g. for the parents)
10 vols, each with logins
1 director/admin (with login)
*/
let vols = [];
let campers = [];
let participation = [];
let roles = [];
let roleGroups = [];
let rolesInRoleGroups = [];

let userIdCount = 0;
let participationIdCount = 0;
let loginIdCount = 0;
let roleId = 0;
let roleGroupId = 0;
let rolesInRoleGroupsId = 0;

let session = createSession();
let admin = createUser();
admin.user.name = 'Betro'; // replace the fake name
admin.login.email = 'betro@example.com';
admin.login.type = 'ADMIN';

// take the master list at the end of this file and 
// make it into 3 separate arrays: roles, role groups, and the relationships between the items in the two sets
// then it can go straight into the DB
masterListOfRoles.map(roleGroup => {
    let roles_ = roleGroup.roles
        .filter(r => roles.find(role => role.name === r) === undefined)
        .map(r=>createRole(r));
    roles = roles.concat(roles_);
    let roleGroup_ = createRoleGroup(roleGroup);
    roleGroups.push(roleGroup_);
    let rolesInRoleGroups_ = createRolesInRoleGroups(roleGroup);
    rolesInRoleGroups = rolesInRoleGroups.concat(rolesInRoleGroups_);
});

let i;
// create volunteers and add them as participants of session 1
for (i=0; i<10; i++) {
    let person = createUser();
    vols.push(person);
    participation = participation.concat(createParticipation(session, person.user, true));
}

// create campers and add them as participants of session 1
for (i=0; i<30; i++) {
    let person = createUser();
    campers.push(person);
    participation = participation.concat(createParticipation(session, person.user, false));
}

// add the admin as a participant
participation.push({
    id: participationIdCount++,
    user_id: admin.user.id,
    session_id: session.id,
    role_id: roles.find(rl => rl.name === 'MAYOR').id,
    start: new Date("2020-01-01T00:00-07:00"),
    end: new Date("2020-12-31T23:59-07:00")
});

// spit out SQL statements from the arrays we just populated with objects
// generate sql for 
// admin, vols, campers, sessions, roles, roleGroups, rolesInRoleGroups, participation
let sql = '\\c :dbname\ncreate extension if not exists pgcrypto;\n';
sql += LOGIN_SQL(admin.login);
sql += '\n';
sql += vols.map(v => LOGIN_SQL(v.login)).join('\n');
sql += campers.map(c => LOGIN_SQL(c.login)).join('\n');
sql += USER_SQL(admin.user, admin.login.id);
sql += '\n';
sql += vols.map(v => USER_SQL(v.user, v.login.id)).join('\n');
sql += campers.map(c => USER_SQL(c.user, c.login.id)).join('\n');
sql += SESSION_SQL(session);
sql += '\n';
sql += roles.map(r => ROLE_SQL(r)).join('\n');
sql += roleGroups.map(rg => ROLE_GROUP_SQL(rg)).join('\n');
sql += rolesInRoleGroups.map(r => ROLES_IN_ROLE_GROUPS_SQL(r)).join('\n');
sql += participation.map(p => PARTICIPATION_SQL(p)).join('\n');

fs.writeFileSync('out', sql);

/***********************/
/* functions to make the objects */
/***********************/
function createSession() {
    return {
        id: 1,
        name: '2020-summer-week1',
        start: new Date("2020-07-05T00:00-07:00"),
        end: new Date("2020-07-11T23:59-07:00")
    };
}

function createParticipation(session, user, isVol) {
    let userRoles = randRoles(isVol);
    return userRoles.map(r => {

        let start = isVol ? faker.date.between("2020-07-05T07:00-07:00", "2020-07-10T18:00-07:00") : new Date("2020-07-06T08:00-07:00");
        let end = isVol ? faker.date.between(start, "2020-07-11T20:00-07:00") : new Date("2020-07-11T17:00-07:00");

        return {
            id: participationIdCount++,
            user_id: user.id,
            session_id: session.id,
            role_id: roles.find(rl => rl.name === r).id,
            start: start,
            end: end
        }
    });
}

function createRole(role) {
    return {
        id: roleId++,
        name: role
    };
}

function createRoleGroup(roleGroup) {
    return {
        id: roleGroupId++,
        name: roleGroup.group
    };
}

function createRolesInRoleGroups(roleGroup) {
    return roleGroup.roles.map(role => ({
        id: rolesInRoleGroupsId++,
        role_group_id: roleGroups.find(item => item.name === roleGroup.group).id,
        role_id: roles.find(r => r.name == role).id
    }));
}
function createUser() {
    let firstname = faker.name.firstName(2);
    let lastname = faker.name.lastName();
    let email = faker.internet.exampleEmail(firstname, lastname);
    return {
        login: {
            id: loginIdCount++,
            email: email,
            password: "dancingpaint",
            type: 'USER'
        },
        user: {
            id: userIdCount++,
            login_id: loginIdCount - 1,
            name: `${firstname} ${lastname}`,
            address: faker.address.streetAddress(true),
            phone: faker.phone.phoneNumber(),
            allergies: randAllergies(),
            tshirt_size: randTShirtSize(),
            meal_pref: randMealPref(),
            emergency_contact_1: `${faker.name.findName()} ${faker.phone.phoneNumber()}`,
            emergency_contact_2: `${faker.name.findName()} ${faker.phone.phoneNumber()}`,
            bio: faker.lorem.paragraph(),
            photo_url: randPhotoUrl()
        }
    };
}


