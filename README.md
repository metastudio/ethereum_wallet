# ETHEREUM WALLET FOR TEST NETWORK

Tested with geth `instance=Geth/v1.8.10-stable/darwin-amd64/go1.10.2`

`geth --rinkeby --rpc --rpcapi="personal,eth" console`

Ruby version: 2.5.0
Rails version: 5.2

with postgresql `psql (PostgreSQL) 10.4`

## Installation

`bundle install`

`rails db:create`
`rails db:migrate`

## Usage

`rails s`

and sign up for creating new user
