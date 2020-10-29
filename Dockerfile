FROM ruby:2.5.0

RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp

RUN bundle install
RUN rails db:migrate

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]