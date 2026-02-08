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
WORKDIR /home/node

# Install community nodes globally
RUN npm install -g \
  n8n-nodes-evolution-api-english \
  n8n-nodes-imap

# Tell n8n where to load custom nodes from
ENV N8N_CUSTOM_EXTENSIONS=/usr/local/lib/node_modules

USER node

ENTRYPOINT []
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

# rebuild trigger v2.1
