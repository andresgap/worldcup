# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY . /myapp

# Add a script to be executed every time the container starts.
#RUN chmod +x setup.sh
RUN bundle config --global frozen 1
RUN bundle install --jobs 4 --without development,test
RUN bundle exec rails assets:precompile
RUN rm -f tmp/pids/server.pid

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
