ARG BUILD_FROM
FROM $BUILD_FROM
ENV LANG C.UTF-8

RUN apk --no-cache add nginx; mkdir -p /run/nginx;

#Copy our conf into the nginx http.d folder.
COPY ingress.conf /etc/nginx/http.d/

ADD package.json /

RUN apk add --update npm &&\
    npm install

EXPOSE 8099

# Copy data for add-on
COPY . .
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"