FROM node:8.12.0-slim

LABEL "com.github.actions.name"="Report to packtracker.io"
LABEL "com.github.actions.description"="Report your webpack build stats to the packtracker.io service."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="#363636"

RUN apt-get update && apt-get install jq -y

COPY ./entrypoint.sh /entrypoint.sh
COPY ./webpack.js /github/workspace/webpack.js
ENTRYPOINT ["/entrypoint.sh"]
