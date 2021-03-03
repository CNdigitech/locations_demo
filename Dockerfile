FROM timbru31/ruby-node:latest


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y nodejs postgresql-client sqlite3 vim --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV test
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV DATABASE_URL "postgres://postgres:bC8CProtaRc41se@cnts.c5ef3k1a8u1g.us-east-1.rds.amazonaws.com/cnts"

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN gem install bundler -v 2.1.4
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /usr/src/app
RUN bundle exec rake db:migrate
RUN bundle exec rake assets:precompile --trace

EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0", "--port", "3001"]
CMD ["bundle", "exec", "rails", "s"]
