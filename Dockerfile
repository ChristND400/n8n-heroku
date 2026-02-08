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

# (Optional) install multiple nodes As below
# RUN npm install -g n8n-nodes-example n8n-nodes-other

# Install community nodes globally at build time
RUN npm install -g n8n-nodes-evolution-api-english n8n-nodes-imap

# Restore correct permissions
USER node

# Custom entrypoint (if you need it)
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT []
CMD ["/entrypoint.sh"]

# rebuild trigger v2.1
