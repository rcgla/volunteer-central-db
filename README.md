# volunteer-central-db

To setup locally:

1. Install PostgreSQL on your machine. There are many options, just google it.
1. Clone the volunteer central [database project](https://github.com/rcgla/volunteer-central-db). 
1. Switch to the `dev` branch
1. Open a terminal and go to the directory where you've cloned it.
1. `cp example.env .env`
1. Create a fresh (empty) database with `run-to-init-test-db.sh` 

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

### Activity and Event visibility

Events are visible by user type (CLIENT, STAFF, ADMIN).

Activities within events are visible by roles, where the roles have only user types that correspond to the event user type.