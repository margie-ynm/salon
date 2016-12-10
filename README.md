# _Hair Salon_

#### _Input stylists and clients for a hair salon, 12/09/2016_

#### By _**Margie Nevarez**_

## Description

_The application navigates the user to a home page where they can begin adding stylists to a list. After submission, the user is able to click on a stylist and add clients(s) for the stylist. The user is also able to update and delete either a stylist or client from database._

## Setup/Installation Requirements

* _Make sure you have postgres installed and running._
* _run psql in terminal, then:_
* Yourusername=# `CREATE DATABASE hair_salon;`
* Yourusername=#`\c hair_salon;`
* hair_salon=# `CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);`
* hair_salon=# `CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);`
* hair_salon=# `CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;`

* _Make sure you have git, ruby, and bundler gem installed._
* _From the command line type "git clone https://github.com/margie-ynm/salon" to download the webapp files._
* _Navigate to the download directory in the command line and enter "bundle" to download additional required gems._
* _Enter "ruby app.rb" to host the site locally._
* _Navigate browser to "localhost:4567" (unless previous step indicates a different local host number)._
* _Enjoy!!_

## Support and contact details

_Github for Margie Nevarez: margie-ynm_

## Technologies Used

* _HTML_
* _CSS_
* _Bootstrap_
* _Ruby_
* _Rspec_
* _Capybara_
* _Sinatra_
* _Postgres_
* _psql_

### License

Copyright (c) 2016 **_Margie Nevarez_**
