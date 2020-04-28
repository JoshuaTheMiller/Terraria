# Want to use slim, but ran into issues...
FROM mono:6.8

# https://github.com/Pryaxis/TShock/releases
ENV TSHOCK_VERSION=4.3.26 

LABEL Author=JoshuaMiller

# jq --> for finding/replacing json value easily
# moreutils --> to leverage sponge, which makes outputing a file from the jq step easier
RUN apt-get update && \
    apt-get install -y jq moreutils zip

ADD https://github.com/NyxStudios/TShock/releases/download/v$TSHOCK_VERSION/tshock_$TSHOCK_VERSION.zip /
RUN unzip tshock_$TSHOCK_VERSION.zip -d /tshock && \
    rm tshock_$TSHOCK_VERSION.zip && \
    chmod 777 /tshock/TerrariaServer.exe

# Allow for external data
VOLUME ["/world", "/tshock/ServerPlugins"]

# Set working directory to server
WORKDIR /tshock

COPY start.sh /usr/local/bin/ 
RUN chmod +x /usr/local/bin/start.sh

# run the start script, which will set the password if provided and then run Terraria
ENTRYPOINT ["start.sh"]