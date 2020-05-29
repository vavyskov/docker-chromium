#FROM alpine:3.11
#FROM browserless/chrome
FROM zenika/alpine-chrome:81-with-puppeteer

USER root

RUN echo "Fonts" \
&&  apk add --no-cache \
        msttcorefonts-installer \
        fontconfig \
&&  update-ms-fonts \
&&  fc-cache -f

#RUN echo "Google fonts" \
#&&  wget https://github.com/google/fonts/archive/master.tar.gz -O gf.tar.gz \
#&&  tar -xf gf.tar.gz \
#&&  mkdir -p /usr/share/fonts/truetype/google-fonts \
#&&  find $PWD/fonts-master/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1 \
#&&  rm -f gf.tar.gz \
#&&  fc-cache -f \
#&&  rm -rf /var/cache/*

USER chrome
