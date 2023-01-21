FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs

ENV APP_ROOT /app/myapp
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock ./
RUN bundle install

# CMD bundle exec rails s -p 2000 -b '0.0.0.0'