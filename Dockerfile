FROM ghcr.io/cronicle-edge/cronicle-edge:latest

# Install Node
RUN apk add --no-cache nodejs npm

# Install git. Trust the bind-mounted script checkouts so git doesn't abort with
# "detected dubious ownership" when the job user differs from the dir owner.
# This base runs git with GIT_CONFIG_NOSYSTEM, so `git config --system` is
# ignored — set safe.directory via the env config mechanism, which is honored.
RUN apk add --no-cache git
ENV GIT_CONFIG_COUNT=1 \
    GIT_CONFIG_KEY_0=safe.directory \
    GIT_CONFIG_VALUE_0=*

# Install pnpm and tsx
RUN npm install -g pnpm tsx

# Keep deno
RUN apk add --no-cache deno

WORKDIR /scripts
