## Gris Demo

Example Rack, Grape, Roar, ActiveRecord Hypermedia API service - Generated with [Gris  0.4.4](https://github.com/artsy/gris).

### How this app was generated

1. Generate the new Gris app ([commit](https://github.com/artsy/gris-demo/commit/0f9b9c4a551d405266de6f9b76a9182105fa71e6)) -
`gris new GrisDemo`

2. Generate an endpoint ([commit](https://github.com/artsy/gris-demo/commit/27a5c9ea2afeb0dae15e6d9d3963c9fe48eb8270)) -
`cd GrisDemo`
`bundle`
`gris generate api person`

3. Generate a migration for the newly generated model ([commit](https://github.com/artsy/gris-demo/commit/318d7f2b84bd29860427e31ec0d1585905cba1d9)) -
`gris generate migration createPeople name:string`

4. Update presenter, endpoint and specs ([commit](https://github.com/artsy/gris-demo/commit/c3edf05a8500907b82761c9fceaf9f7f2b8f9b08)) -
`bundle exec rake db:create RACK_ENV=test`
`bundle exec rake db:migrate RACK_ENV=test`
`bundle exec rake`

At this point, [RuboCop](https://github.com/bbatsov/rubocop) and API client specs via [Hyperclient](https://github.com/codegram/hyperclient) should pass. You can run the app in development thusly:

`bundle exec rake db:create`
`bundle exec rake db:migrate`
`shotgun`

This new app should now be up and running at the default for shotgun - http://localhost:9393/
