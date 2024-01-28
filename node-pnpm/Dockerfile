FROM node:20-slim AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
ENV NPM_CONFIG_LOGLEVEL warn
RUN corepack enable

COPY . /app
WORKDIR /app

# Install dependencies with pnpm and cache mount
RUN --mount=type=cache,id=pnmcache,target=/pnpm_store \
    pnpm config set store-dir /pnpm_store && \
    pnpm config set package-import-method copy && \
    pnpm install --prefer-offline --ignore-scripts --frozen-lockfile


FROM base

COPY --from=prod-deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist
EXPOSE 8000

CMD [ "pnpm", "start" ]
