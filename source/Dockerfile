# Want to use slim, but ran into issues...
FROM mono:6.8
LABEL Author="JoshuaMiller"

EXPOSE 7777

# https://github.com/Pryaxis/TShock/releases
ARG TSHOCK_VERSION=4.5.18
ARG TSHOCK_ORIG_ZIP_NAME=TShock4.5.18_Terraria1.4.3.6.zip

ARG TERRARIA_USER_UID=8433
ARG TERRARIA_USER_NAME=terraria

COPY default_config.json world/
COPY start.sh /usr/local/bin/ 

ADD https://github.com/Pryaxis/TShock/releases/download/v$TSHOCK_VERSION/$TSHOCK_ORIG_ZIP_NAME /tshock_$TSHOCK_VERSION.zip

# jq --> for finding/replacing json value easily
# moreutils --> to leverage sponge, which makes outputing a file from the jq step easier
RUN apt-get update && \
    apt-get install -y jq moreutils unzip --no-install-recommends && \    
    unzip tshock_$TSHOCK_VERSION.zip -d /tshock && \
    rm tshock_$TSHOCK_VERSION.zip && \
    useradd -u $TERRARIA_USER_UID $TERRARIA_USER_NAME && \
    chown -R $TERRARIA_USER_NAME tshock/ && chmod 700 /tshock/TerrariaServer.exe && chmod -R u+rw tshock/ && \    
    chown -R $TERRARIA_USER_NAME world && chmod -R 700 world && \                      
    mkdir -p /home/terraria/ && chown -R $TERRARIA_USER_NAME /home/terraria/ && \
    chown $TERRARIA_USER_NAME /usr/local/bin/start.sh && chmod 500 /usr/local/bin/start.sh

# Allow for external data
VOLUME ["/world", "/tshock/ServerPlugins"]

# Set working directory to server
WORKDIR /tshock

USER terraria

# run the start script, which will set the password if provided and then run Terraria
ENTRYPOINT ["start.sh"]
CMD ["-autocreate", "1", "-world", "/world/Terrarium.wld"]
