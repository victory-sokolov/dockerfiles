#!/bin/bash
set -e

# Start CouchDB in background
/docker-entrypoint.sh couchdb &

ADMIN_USER=${COUCHDB_USER:-admin}
ADMIN_PASS=${COUCHDB_PASSWORD:-password}

# Wait for CouchDB to be ready
until curl -s http://localhost:5984/_up | grep -q '"status":"ok"'; do
  echo "Waiting for CouchDB to be ready..."
  sleep 1
done

echo "✅ CouchDB is ready, initializing system databases..."

curl -u "$ADMIN_USER:$ADMIN_PASS" -X PUT http://localhost:5984/_users
curl -u "$ADMIN_USER:$ADMIN_PASS" -X PUT http://localhost:5984/_replicator
curl -u "$ADMIN_USER:$ADMIN_PASS" -X PUT http://localhost:5984/_global_changes

# Wait for CouchDB to finish (keep foreground process alive)
wait
