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
6. Run the script `./run-to-reset-test-db.sh`

This will initialize a Volunteer Central database and fill it with fake data.
