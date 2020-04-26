FROM ruby:2.6.5
ENV LANG C.UTF-8

# install required libraries
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# install bundler
RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /api
COPY . /api