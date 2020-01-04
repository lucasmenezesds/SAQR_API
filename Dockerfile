FROM ruby:2.5-buster

WORKDIR /opt/app

COPY . /opt/app

RUN apt-get update -y && \
apt-get install -y ubuntu-dev-tools libpq-dev libgsl0-dev && bundle install

# RUN bundle config --global frozen 1

CMD ["bash", "start.sh"]