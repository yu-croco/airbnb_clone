FROM ruby:2.5.0
ENV LANG C.UTF-8

RUN mkdir /app
WORKDIR /app
ADD Gemfile Gemfile.lock ./

RUN apt-get update && \
    apt-get install -y build-essential build-essential apt-utils libpq-dev postgresql-client nodejs && \
    gem install bundler && \
    bundle install
