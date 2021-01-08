# volunteer-central-db

This is a PostgreSQL database. It is part of a set of projects related to RCGLA Volunteer Central:

* [The database (this one)](https://github.com/rcgla/volunteer-central-db)
* [The database API](https://github.com/rcgla/volunteer-central-db-api)
* [The site](https://github.com/rcgla/volunteer-central-site)

To use it locally, you need PostgreSQL running in the background on your machine. 

1. Download and install a PostgreSQL environment, such as https://postgresapp.com/
2. Make sure that's up and running
3. Open a terminal and go to the directory where you've cloned this repository. Make sure you're on the `dev` branch.
4. Add execute permissions to the script (you just need to do this one time in your life) ```chmod u+x run-to-reset-test-db.sh```
5. Clone the env file `cp example.env .env`
6. Make sure you have Node installed
7. `cd gen-test-data`
8. Run `npm install`
9. Run the script `./run-to-reset-test-db.sh`

This will initialize a Volunteer Central database and create an admin login.

## Altering the database

New schema are applied using migrations

Each migration updates the version number in DbInfo

New tables need new permissions models

Note that the initial permissions models are set in `dbroles.pgsql` and `policies.pgsql` and ended with `cascade_dbroles.pgsql`, and those cascading rules don't apply to new policies, so they'd have to be invoked again or the new policies would have to include all applicable roles.

## Logins

Logins are now username/password instead of email password. Of course, someone could use their email address as a username, but it's not required. Wanted to separate emails from usernames in the case that a parent has 1 contact email but multiple campers enrolled, each with their own logins.

Multi-person logins are complicated and not addressed in the database. We might have a quick "switch users" feature in the website which would require parents to log into multiple accounts and then work with cookies and swap out the token behind the scenes.

## Repeating activities

About repeating activities -- an activity can repeat, meaning that activities with the same name and with `repeat=true` appear on more than one day, at the same time.


## Caveats

If this db were ever publicly query-able, we should adjust the settings for the [pgFilter](https://github.com/graphile-contrib/postgraphile-plugin-connection-filter) plugin due to the warning described on its page.

## Data visibility

Database uses row level security and access tokens; although the DB is never directly queried by the client, its design should withstand such usage should we decide to implement certain features with HTML + API instead of doing everything on the server.

In the data descriptions below, assume that any table may contain any number of database IDs linking the row to other rows in other tables; however, these IDs are not meaningful on their own, so we don't have to worry about their visibility.

Also, the role ADMIN is not enumerated below, as admins can view and edit everything.

|Table | Data | Staff | Client | 
|------|------|-------|--------|
| Activities | What where when | View STAFF, CLIENT + role restrictions | View CLIENT + role restrictions |
| ActivitiesRooms | - | View | View |
| ActivityTypes | Enumeration | View | View |
| DbInfo | Software version | - | - |
| EmergencyContacts | Name, address, phone, relation | View & edit own | View & edit own |
| EventTypes | Enumeration | View | View | View |
| Events | What, times | View STAFF | View CLIENT |
| Locations | Addresses for locations used by camp | View | View |
| Logins | Usernames, hashed passwords | Edit own pwd | Edit own pwd |
| Photos | Pics of ppl | View | View |
| Placements | Confirmed, dropped | View | View |
| Roles | Enumeration | View | View |
| RoleGroups | Enumeration | View | View |
| Rooms | Room number | View | View |
| TrackTypes | Enumeration | View | View |
| Tracks | Track name, times | View | View |
| TshirtSizes | Enumeration | View | View |
| UserAvailability | Times | View | View |
| UserGroups | Group name | View | View |
| UsersPrivateInfo | Phone, bio, address, email | View, edit own | View, edit own |
| UsersProtectedInfo | Meal pref, tshirt size, food allergies, medical | View | View, edit own |
| Users | Name, usertype | View | View |
---

### Activity and Event visibility

Events are visible by user type (CLIENT, STAFF, ADMIN).

Activities within events are visible by roles, where the roles have only user types that correspond to the event user type.