FROM ruby:2.7.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /accept-file

COPY Gemfile /accept-file/Gemfile
COPY Gemfile.lock /accept-file/Gemfile.lock
COPY . /accept-file
RUN bundle install

EXPOSE 3000
