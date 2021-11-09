ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV PKTRIOT_VERSION 0.10.8

RUN apk add --no-cache jq curl

RUN if [ "$BUILD_ARCH" = "armhf" ] || [ "$BUILD_ARCH" = "armv7" ] ; \
  then curl -s -o pktriot.tar.gz https://download.packetriot.com/linux/tarballs/pktriot-$(PKTRIOT_VERSION).arm32.tar.gz ; \
  elif [ "$BUILD_ARCH" = "aarch64" ] ; \
  then curl -s -o pktriot.tar.gz https://download.packetriot.com/linux/tarballs/pktriot-$(PKTRIOT_VERSION).arm64.tar.gz ; \
  elif [ "$BUILD_ARCH" = "amd64" ] ; \
  then curl -s -o pktriot.tar.gz https://download.packetriot.com/linux/tarballs/pktriot-$(PKTRIOT_VERSION).amd64.tar.gz ; \
  else echo 'Unsupported arch' && exit 1 ; \
  fi && \
  tar -xvzf pktriot.tar.gz --strip-components=1 && \
  rm pktriot.tar.gz

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
