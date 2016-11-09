[![Build Status](https://travis-ci.org/viniciuspalma/backend-code-challenge.svg?branch=master)](https://travis-ci.org/viniciuspalma/backend-code-challenge)
[![Code Climate](https://codeclimate.com/github/viniciuspalma/backend-code-challenge/badges/gpa.svg)](https://codeclimate.com/github/viniciuspalma/backend-code-challenge)
[![Test Coverage](https://codeclimate.com/github/viniciuspalma/backend-code-challenge/badges/coverage.svg)](https://codeclimate.com/github/viniciuspalma/backend-code-challenge/coverage)

# Backend code challenge

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    cp config/databse.yml.example config/database.yml
    bundle exec rake db:setup

It assumes you have a machine equipped with Ruby, Postgres, etc.

## Docker Compose

Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application’s services. All containers declared in docker-compose.yml.

To up the containers use:

    docker-compose up

[more informations about docker compose](https://docs.docker.com/compose/overview/)
