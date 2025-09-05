FROM debian:bullseye-slim


ENV PGBOUNCER_VERSION=1.24.1
ENV PGBOUNCER_USER=pgbouncer
ENV PGBOUNCER_HOME=/etc/pgbouncer

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    libevent-dev \
    libssl-dev \
    postgresql-client \
    pgbouncer \
    && rm -rf /var/lib/apt/lists/*

# Create pgbouncer user and config directory
RUN useradd -r -s /bin/false ${PGBOUNCER_USER} \
    && mkdir -p ${PGBOUNCER_HOME} \
    && chown -R ${PGBOUNCER_USER}:${PGBOUNCER_USER} ${PGBOUNCER_HOME}

# Copy default config files (you can mount your own at runtime too)
COPY pgbouncer.ini ${PGBOUNCER_HOME}/pgbouncer.ini
COPY userlist.txt ${PGBOUNCER_HOME}/userlist.txt

# Fix permissions
RUN chmod 600 ${PGBOUNCER_HOME}/pgbouncer.ini ${PGBOUNCER_HOME}/userlist.txt \
    && chown -R ${PGBOUNCER_USER}:${PGBOUNCER_USER} ${PGBOUNCER_HOME}

# Expose default PgBouncer port
EXPOSE 6432

# Run as non-root
USER ${PGBOUNCER_USER}

ENTRYPOINT ["pgbouncer"]
CMD ["-u", "pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
