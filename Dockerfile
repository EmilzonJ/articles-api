# syntax=docker/dockerfile:1
FROM ruby:3.0.6

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client imagemagick graphviz
WORKDIR /articles-api
COPY Gemfile /articles-api/Gemfile
COPY Gemfile.lock /articles-api/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN sed -i 's/\r$//' /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
