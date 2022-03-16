## This is simple test application, the main idea is to parse csv files, insert data into database and show data on main page with ability to search.

## How to start the project:

### 1. Requirements
Install Ruby 3.0, Rails 7, PostgreSQL 13.

### 2. Create a development database.

There are standart basic credentials for database in .env file

POSTGRES_USER=postgres_user

POSTGRES_PASSWORD=postgres_user

POSTGRES_HOST=localhost

You can change this credentials and user your own. If you change these credentials, then, you need to use your own in the point 3.

### 3. To create database user and database run: 

sudo -u postgres createuser -s postgres_user

sudo -u postgres createdb serials_storage_development

sudo -u postgres createdb serials_storage_test

sudo -u postgres psql

**(In psql) alter postgres_user with password 'postgres_user';

**(In psql) grant all privileges on database serials_storage_development to postgres_user ;

After that the database should be prepared.
You can test this, just run command 'rails c'

### 4. How to parse files and fill database with data:

There are 2 rake tasks to fill serials data and reviews data.

To run them

#### SERIALS_DATA_FILE='./tv_series.csv' rake populate_data:reviews 

#### REVIEWS_DATA_FILE='./tv_series.csv' rake populate_data:reviews

SERIALS_DATA_FILE and REVIEWS_DATA_FILE - are ENV variables

