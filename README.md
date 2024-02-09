# README
Articles API

## Env File

Duplicate `.env.dev-example ` and rename the duplicate to `.env.development`

## Docker

Install docker on your local machine.

And run the following command to se up the containers:

The first time you run this you will need to build the images, so run:
```bash
docker-compose up -d --build
```
After the first time you run --build, is required only when you change the Dockerfile or the Gemfile, otherwise you can just run:
```bash
docker-compose up -d
```

This should set up 2 containers: PostgresDB, Rails API.

Then run the following to setup the db:

```bash
docker exec articles-api rails db:prepare
```

You can attach to the rails log with
```bash
docker attach articles-api
```

To detach use `CTRL-p CTRL-q` in key sequence

Done!

If you need to up the database, you can run:

```bash
docker exec articles-api  rails db:prepare
```

If you use a gem that requires a bundle install, you can run:

```bash
docker articles-api bundle install
```

##### If you are using Docker Desktop, you can use the GUI to see the containers running, the logs, and exec commands in the container.


# Testing
## Running Tests with Coverage
This project uses RSpec, Shoulda Matchers and FactoryBot.

To run the entire test suite, use the following command:
```bash
bundle exec rspec
```

This will run all the test files (*_spec.rb) in the spec directory.

If you want to run a specific test file, you can do so by providing the path to the file. For example, to
run the tests in the articles_spec.rb file, you would use the following command:
```bash
bundle exec rspec spec/models/article_spec.rb
```

## Viewing the Report
When you run your tests, SimpleCov will automatically start gathering coverage data.

After your tests have run, SimpleCov generates a coverage report in the `coverage` directory in your project root.
To view the report, open the `index.html` file in this directory in your web browser.

The report shows a list of all your files, along with the percentage of lines covered by tests in each file. It also
shows a total coverage percentage at the top.

