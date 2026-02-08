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
RUN mkdir -p /home/node/.n8n/nodes \
  && chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node/.n8n/nodes

# Install your community nodes
RUN npm install --omit=dev --no-audit --no-fund \
  n8n-nodes-evolution-api-english \
  n8n-nodes-imap

# Keep your existing entrypoint if you need it
USER root
WORKDIR /home/node/packages/cli
ENTRYPOINT []
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]

# rebuild trigger v2.1
