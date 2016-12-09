Guest=# `CREATE DATABASE hair_salon`
Guest=#`\c hair_salon`
hair_salon=# `CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int)`
hair_salon=# `CREATE TABLE stylists (id serial PRIMARY KEY, name varchar)`
hair_salon=# `CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon`
