# Django, Gunicorn, Traefik Docker image

Build the image

```bash
docker-compose up -d
```

Run migrations

```bash
docker-compose exec web python manage.py migrate --noinput
```

Connect to Postgres
```bash
docker-compose exec db psql --username=django_traefik --dbname=django_traefik
```

--- 
## Reference: 
https://testdriven.io/blog/django-docker-traefik/?utm_source=pocket_mylist
