# README

To run site:

> docker compose up

> docker compose exec -it library-manager sh

inside the shell of container run:

> rails db:setup (only on first run)

> rail s -b 0.0.0.0

the site will be available at localhost:3000

To run tests:

> docker compose exec -it library-manager sh

inside the shell of container run:

> rspec


Credentials:

Member user: 
    email: member1@mail.com
    password: member1@123

Librarian user:
    email: librarian@mail.com
    password: lib@123


