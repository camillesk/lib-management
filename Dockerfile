# syntax=docker/dockerfile:1
FROM ruby:3.1.2-alpine

RUN apk --update add -qq && apk add --no-cache nodejs curl tzdata libffi-dev \
    cmake gcc alpine-sdk linux-headers git zlib-dev openssl-dev gperf \
    libgcc libstdc++ libx11 glib libxrender libxext libintl postgresql-dev

WORKDIR /usr/src/library-management

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
