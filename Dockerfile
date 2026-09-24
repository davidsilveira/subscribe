FROM ruby:4.0.7-slim

WORKDIR /app

COPY Gemfile ./

RUN gem install bundler

RUN bundle install

COPY . .
