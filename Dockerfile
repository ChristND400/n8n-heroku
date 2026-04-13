# The first version without community nodes enforced

# FROM n8nio/n8n:latest

# USER root

# WORKDIR /home/node/packages/cli
# ENTRYPOINT []

# COPY ./entrypoint.sh /
# RUN chmod +x /entrypoint.sh
# CMD ["/entrypoint.sh"]

# Updated version (with community nodes installation for Heroku)
# Because community nodes get installed onto the local disk (inside the dyno/container). 
# Heroku’s filesystem is ephemeral, so when the dyno restarts/recycles, those files can disappear and n8n then marks the package as “missing / broken”, forcing to reinstall.)
# This version below makes sure to tell n8n to auto-reinstall missing community nodes

FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n/nodes \
  && chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node/.n8n/nodes

# Install community nodes list
RUN npm install --omit=dev --no-audit --no-fund \
  n8n-nodes-evolution-api-english 
  # n8n-nodes-imap
  # n8n-nodes-globals

# existing entrypoint
USER root
WORKDIR /home/node/packages/cli
ENTRYPOINT []
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]

# New version

# FROM n8nio/n8n:stable

# USER root

# # Create custom nodes directory and install build tools needed by native npm modules
# RUN mkdir -p /home/node/.n8n/nodes \
#     && chown -R node:node /home/node/.n8n \
#     && apk add --no-cache python3 make g++

# USER node
# WORKDIR /home/node/.n8n/nodes

# # Install community nodes
# RUN npm install --omit=dev --no-audit --no-fund \
#     n8n-nodes-evolution-api-english \
#     n8n-nodes-digital-ocean \
#     n8n-nodes-globals

# USER root
# WORKDIR /home/node/packages/cli

# ENTRYPOINT []
# COPY ./entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# CMD ["/entrypoint.sh"]

# rebuild trigger v2.3
