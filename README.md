# cloudfoundry-mongodb-broker
#### Service broker PoC for MongoDB in cloud foundry ecosystem.

* Written in ruby, using grape as API framework.
* Uses RSpec for testing.
* See .env file for required environment variables.

### Endpoints
    GET /v2/catalog

#### How to test
    bundle exec rspec

#### How to run
    bundle exec rackup
