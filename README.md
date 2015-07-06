## Gris Demo


Example Rack, Grape, Roar, ActiveRecord Hypermedia API service - Generated with [Gris  0.3.4](https://github.com/artsy/gris).

### How this app was generated

1. Generate the new Gris app ([commit](https://github.com/artsy/gris-demo/commit/06c6500e1244f09956ec3ef8c707d964e7ae1abe)) -
`gris new GrisDemo`

2. Generate an endpoint ([commit](https://github.com/artsy/gris-demo/commit/ac1c51a54947e2fc90d8db78a911eff7fed53be6)) -
`cd GrisDemo`
`bundle`
`gris generate api person`

3. Generate a migration for the newly generated model ([commit](https://github.com/artsy/gris-demo/commit/70bbdd5380095e1523e42b08a56a0fc252b7e1dd)) -
`gris generate migration createPeople name:string`

4. Update presenter, endpoint and specs ([commit](https://github.com/artsy/gris-demo/commit/6e4e1d6cad4c57f231b7d6a1d493da010d784c02)) -
`bundle exec rake db:create RACK_ENV=test`
`bundle exec rake db:migrate RACK_ENV=test`
`bundle exec rake`

At this point, [RuboCop](https://github.com/bbatsov/rubocop) and API client specs via (Hyperclient)[https://github.com/codegram/hyperclient] should pass. You can run the app in development thusly:

`bundle exec rake db:create`
`bundle exec rake db:migrate`
`shotgun`

This new app should now be up and running at the default for shotgun - http://localhost:9393/
