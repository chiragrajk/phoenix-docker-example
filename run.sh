#!/bin/sh

set -e

# Ensure the app's dependencies are installed
mix deps.get

# Install JS libraries
echo "Installing JS..."
cd assets && yarn install
cd ..

# Wait for Postgres to become available.
until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

echo "Postgres is available: continuing with database setup..."

# Potentially Set up the database
mix ecto.create
mix ecto.migrate

echo "Launching Phoenix web server..."
# Start the phoenix web server
mix phx.server