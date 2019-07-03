FROM node:11-slim

LABEL "com.github.actions.name"="Report to packtracker.io"
LABEL "com.github.actions.description"="Report your webpack build stats to the packtracker.io service."
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="gray-dark"

RUN apt-get update && apt-get install jq git -y && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh
COPY ./report.js /report.js
ENTRYPOINT ["/entrypoint.sh"]
