FROM ruby:2.5.0

RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn && mkdir /myapp
WORKDIR /myapp
COPY . /myapp

RUN bundle install && rails db:migrate

EXPOSE 3000 3001 30002


CMD ["rails", "server", "-b", "0.0.0.0","-p","3001"]