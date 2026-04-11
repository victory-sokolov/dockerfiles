# MSSQL

Run MSSQL database using Docker Compose.

## Usage

```bash
cd databases/mssql
cp .env.example .env
# Edit .env with your desired password
docker compose up -d
```

## Connection

- Host: localhost
- Port: 1433
- Username: sa
- Password: (from MSSQL_SA_PASSWORD env var)