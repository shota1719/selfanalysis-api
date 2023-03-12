FROM ruby:3.1.2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  default-libmysqlclient-dev \
  default-mysql-client \
  xvfb \
  redis-tools && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  lsof

ENV APP_ROOT /app/myapp
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile Gemfile.lock ./
RUN bundle install

ADD . ./

# CMD bundle exec rails s -p 2000 -b '0.0.0.0'