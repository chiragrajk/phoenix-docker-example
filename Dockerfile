# Elixir + Phoenix

FROM elixir:1.7.4-alpine

# Install debian packages
RUN apk update
RUN apk add --no-cache --virtual .build-deps curl inotify-tools postgresql-client yarn

# Install Phoenix packages
RUN mix local.hex --force && mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

WORKDIR /app
EXPOSE 4000