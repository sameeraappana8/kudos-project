# Kudos Project

```bash
git clone github.com:sameeraappana8/kudos-project.git
bundle install
rails db:migrate
rails server
```

A user can give Kudos to the same user more than once in a week. I have written the functionality in this way as it is easier for testing. I can implement giving kudos to another user only once every week provided more time.

## Running the Tests

The Kudos Project has a test suite built with rspec. To execute tests call the following in the project directory:

```bash
bundle exec rspec
```

If I had more time I could've implemented fixtures for generating random data for test database.
