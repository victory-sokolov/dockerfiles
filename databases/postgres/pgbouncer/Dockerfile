FROM edoburu/pgbouncer:1.23.1

COPY userlist.txt /etc/pgbouncer/
COPY pgbouncer.ini /etc/pgbouncer/

CMD ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
