# FROM n8nio/n8n:latest

# USER root

# WORKDIR /home/node/packages/cli
# ENTRYPOINT []

# COPY ./entrypoint.sh /
# RUN chmod +x /entrypoint.sh
# CMD ["/entrypoint.sh"]

# Updated version

FROM n8nio/n8n:latest

USER root

# Enable pnpm via Corepack
RUN corepack enable && corepack prepare pnpm@latest --activate

# Install community nodes with pnpm
RUN pnpm add -g \
  n8n-nodes-evolution-api-english \
  n8n-nodes-imap

USER node

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT []
CMD ["/entrypoint.sh"]

# rebuild trigger v2.1
