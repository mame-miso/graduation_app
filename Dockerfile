FROM ruby:3.2

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler && bundle install

COPY . /app

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0"]