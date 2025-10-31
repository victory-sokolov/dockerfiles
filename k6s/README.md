# K6 Load testing tool

# Start monitoring infrastructure
docker compose up -d influxdb grafana

# Run any test script
docker compose run --rm k6 run /scripts/basic-test.js
docker compose run --rm k6 run /scripts/stress-test.js
docker compose run --rm k6 run /scripts/spike-test.js

# Set target URL and run test
TARGET_URL=https://yourapp.com docker compose run --rm k6 run /scripts/api-test.js

# Or use .env file
echo "TARGET_URL=https://yourapp.com" > .env
docker compose run --rm k6 run /scripts/api-test.js
