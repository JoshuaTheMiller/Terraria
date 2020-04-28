FROM mono:slim

LABEL Author=JoshuaMiller

# jq --> for finding/replacing json value easily
# moreutils --> to leverage sponge, which makes outputing a file from the jq step easier
RUN apt update && \
    apt install -y jq moreutils