FROM node:24-slim AS base

ENV PNPM_HOME="/pnpm"
ENV BUN_INSTALL="/bun"
ENV PATH="$PNPM_HOME:$BUN_INSTALL/bin:$PATH"
ENV NPM_CONFIG_LOGLEVEL warn
RUN corepack enable

COPY . /app
WORKDIR /app

FROM base AS deps
RUN --mount=type=cache,id=pnpmcache,target=/pnpm_store \
    pnpm config set store-dir /pnpm_store && \
    pnpm config set package-import-method copy && \
    pnpm install --prefer-offline --ignore-scripts --frozen-lockfile

RUN curl -fsSL https://bun.sh/install | bash

FROM base AS build
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN bun build ./src/index.ts --outdir ./dist --target=bun

FROM base

COPY --from=deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist
EXPOSE 8000

CMD [ "bun", "run", "start" ]
