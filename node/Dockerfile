FROM node:24-alpine AS base

RUN apk add --no-cache curl libc6-compat

RUN curl -fsSL https://bun.sh/install | bash
ENV BUN_INSTALL="$HOME/.bun"
ENV PATH="$BUN_INSTALL/bin:$PATH"

WORKDIR /app

FROM base AS deps
COPY package.json bun.lock* ./
RUN bun install --frozen-lockfile

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN bun run build

FROM node:24-alpine AS runner

RUN apk add --no-cache curl libc6-compat
RUN curl -fsSL https://bun.sh/install | bash
ENV BUN_INSTALL="$HOME/.bun"
ENV PATH="$BUN_INSTALL/bin:$PATH"

WORKDIR /app

ENV NODE_ENV=production

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

COPY --from=builder /app/dist ./dist

USER nodejs

EXPOSE 3000

ENV HEALTH_PATH=/health
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- "http://localhost:3000${HEALTH_PATH}" || exit 1

CMD ["bun", "run", "dist/index.js"]