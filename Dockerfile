FROM ghcr.io/cronicle-edge/cronicle-edge:latest

# Install Node
RUN apk add --no-cache nodejs npm

# Install git and trust the bind-mounted script checkouts (avoids git's
# "detected dubious ownership" when the job user differs from the dir owner)
RUN apk add --no-cache git \
    && git config --system --add safe.directory '*'

# Install pnpm and tsx
RUN npm install -g pnpm tsx

# Keep deno
RUN apk add --no-cache deno

WORKDIR /scripts
