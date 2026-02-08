# FROM n8nio/n8n:latest

# USER root

# WORKDIR /home/node/packages/cli
# ENTRYPOINT []

# COPY ./entrypoint.sh /
# RUN chmod +x /entrypoint.sh
# CMD ["/entrypoint.sh"]

# Updated version

USER root

# Ensure the community nodes folder exists and is owned by node
RUN mkdir -p /home/node/.n8n/nodes \
  && chown -R node:node /home/node/.n8n

USER node

# Install community nodes into the location n8n loads from
RUN npm install --prefix /home/node/.n8n/nodes \
  n8n-nodes-evolution-api-english \
  n8n-nodes-imap

USER root
WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

# rebuild trigger v2.1
