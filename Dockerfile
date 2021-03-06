#FROM alpine:3.11
#FROM browserless/chrome
FROM zenika/alpine-chrome:81-with-puppeteer

USER root

RUN echo "GNU fonts 'FreeSans', 'FreeSerif', 'FreeMono' (Latin Extended)" \
&&  apk add --no-cache \
        ttf-freefont

#RUN echo "Open fonts (Latin)" \
#&&  apk add --no-cache \
#        font-noto \
#        terminus-font \
#        font-bakoma \
#        font-croscore
#        ttf-opensans \
#        font-misc-misc \
#&&  fc-cache -f

RUN echo "Open font 'Noto Sans' (Latin Extended)" \
&&  apk add --no-cache --virtual .build-deps \
        curl \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSans-hinted.zip \
&&  mkdir -p /usr/share/fonts/opentype/NotoSans \
&&  unzip NotoSans-hinted.zip -d /usr/share/fonts/opentype/NotoSans/ \
&&  chmod o+r -R /usr/share/fonts/opentype/NotoSans/ \
&&  rm NotoSans-hinted.zip \
&&  fc-cache -f \
&&  apk del --purge .build-deps

RUN echo "Open font 'Noto Serif' (Latin Extended)" \
&&  apk add --no-cache --virtual .build-deps \
        curl \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSerif-hinted.zip \
&&  mkdir -p /usr/share/fonts/opentype/NotoSerif \
&&  unzip NotoSerif-hinted.zip -d /usr/share/fonts/opentype/NotoSerif/ \
&&  chmod o+r -R /usr/share/fonts/opentype/NotoSerif/ \
&&  rm NotoSerif-hinted.zip \
&&  fc-cache -f \
&&  apk del --purge .build-deps

RUN echo "Open font 'Noto Sans Display' (Latin Extended)" \
&&  apk add --no-cache --virtual .build-deps \
        curl \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSansDisplay-hinted.zip \
&&  mkdir -p /usr/share/fonts/opentype/NotoSansDisplay \
&&  unzip NotoSansDisplay-hinted.zip -d /usr/share/fonts/opentype/NotoSansDisplay/ \
&&  chmod o+r -R /usr/share/fonts/opentype/NotoSansDisplay/ \
&&  rm NotoSansDisplay-hinted.zip \
&&  fc-cache -f \
&&  apk del --purge .build-deps

RUN echo "Open font 'Noto Serif Display' (Latin Extended)" \
&&  apk add --no-cache --virtual .build-deps \
        curl \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifDisplay-hinted.zip \
&&  mkdir -p /usr/share/fonts/opentype/NotoSerifDisplay \
&&  unzip NotoSerifDisplay-hinted.zip -d /usr/share/fonts/opentype/NotoSerifDisplay/ \
&&  chmod o+r -R /usr/share/fonts/opentype/NotoSerifDisplay/ \
&&  rm NotoSerifDisplay-hinted.zip \
&&  fc-cache -f \
&&  apk del --purge .build-deps

RUN echo "Open font 'Noto Mono' (Latin Extended)" \
&&  apk add --no-cache --virtual .build-deps \
        curl \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoMono-hinted.zip \
&&  mkdir -p /usr/share/fonts/opentype/NotoMono \
&&  unzip NotoMono-hinted.zip -d /usr/share/fonts/opentype/NotoMono/ \
&&  chmod o+r -R /usr/share/fonts/opentype/NotoMono/ \
&&  rm NotoMono-hinted.zip \
&&  fc-cache -f \
&&  apk del --purge .build-deps

RUN echo "Open font 'Noto Sans Mono' (Latin Extended)" \
&&  apk add --no-cache --virtual .build-deps \
        curl \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSansMono-hinted.zip \
&&  mkdir -p /usr/share/fonts/opentype/NotoSansMono \
&&  unzip NotoSansMono-hinted.zip -d /usr/share/fonts/opentype/NotoSansMono/ \
&&  chmod o+r -R /usr/share/fonts/opentype/NotoSansMono/ \
&&  rm NotoSansMono-hinted.zip \
&&  fc-cache -f \
&&  apk del --purge .build-deps

#RUN echo "Open Google fonts (free to use - https://developers.google.com/fonts)" \
#&&  wget https://github.com/google/fonts/archive/master.tar.gz -O gf.tar.gz \
#&&  tar -xf gf.tar.gz \
#&&  mkdir -p /usr/share/fonts/truetype/google-fonts \
#&&  find $PWD/fonts-master/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1 \
#&&  rm -f gf.tar.gz \
#&&  fc-cache -f \
#&&  rm -rf /var/cache/*

## Open Google fonts: 'Inconsolata', 'Fira Code' (monospace)
## Free font: 'mononoki' (monospace)

#RUN echo "Commercial fonts (not recommended for commercial or open source projects)" \
#&&  apk add --no-cache \
#        msttcorefonts-installer \
#        fontconfig \
#&&  update-ms-fonts \
#&&  fc-cache -f

USER chrome
