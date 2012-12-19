Movie Tracker Application
===========
What is Movie Tracker?
----------------
Movie Tracker is a web application that allows a user to have a record of whether or not he/she has already seen a movie.
A user will be able to choose from a list of movies which ones he/she has already watch.

App Dependencies
----------------

```
Database = PostgreSQL
Rails version =  3.2.8
```

Installation
---------------

```
$ git clone https://github.com/jfgomez86/movietracker
$ cd movietracker #(You need to accept the .rvmrc configuration file.)
$ bundle
$ rake db:create
$ rake db:migrate
$ rails server
```
