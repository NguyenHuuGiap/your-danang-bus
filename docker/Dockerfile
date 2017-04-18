FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /your-danang-bus
WORKDIR /your-danang-bus
ADD Gemfile /your-danang-bus/Gemfile
ADD Gemfile.lock /your-danang-bus/Gemfile.lock
RUN bundle config git.allow_insecure true
RUN bundle install
ADD . /your-danang-bus