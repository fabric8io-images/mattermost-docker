FROM centos:7

ENV MATTERMOST_VERSION 3.10.0

RUN cd / && \
    curl -LO https://releases.mattermost.com/${MATTERMOST_VERSION}/mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz && \
    tar xf mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz &&\
    rm mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz
    
RUN chgrp -R 0 /mattermost
RUN chmod -R g+rw /mattermost
RUN find /mattermost -type d -exec chmod g+x {} +

WORKDIR /mattermost

CMD [ "/mattermost/bin/platform" ]

