#FROM alpine:3.11
#FROM browserless/chrome
FROM zenika/alpine-chrome:81-with-puppeteer

USER root

RUN echo "Free fonts" \
&&  apk add --no-cache \
        font-noto \
        font-noto-adlam \
        font-noto-adlamunjoined \
        font-noto-arabic \
        font-noto-armenian \
        font-noto-avestan \
        font-noto-bamum \
        font-noto-bengali \
        font-noto-buhid \
        font-noto-carian \
        font-noto-chakma \
        font-noto-cherokee \
        font-noto-cypriot \
        font-noto-deseret \
        font-noto-devanagari \
        font-noto-emoji \
        font-noto-ethiopic \
        font-noto-extra \
        font-noto-georgian \
        font-noto-glagolitic \
        font-noto-gothic \
        font-noto-gujarati \
        font-noto-gurmukhi \
        font-noto-hebrew \
        font-noto-kannada \
        font-noto-kayahli \
        font-noto-khmer \
        font-noto-lao \
        font-noto-lisu \
        font-noto-malayalam \
        font-noto-mandaic \
        font-noto-myanmar \
        font-noto-nko \
        font-noto-olchiki \
        font-noto-oldturkic \
        font-noto-oriya \
        font-noto-osage \
        font-noto-osmanya \
        font-noto-shavian \
        font-noto-sinhala \
        font-noto-tamil \
        font-noto-telugu \
        font-noto-thaana \
        font-noto-thai \
        font-noto-tibetan \
        font-noto-tifinagh \
        font-noto-vai
        terminus-font \
        font-bakoma \
        font-croscore
        ttf-opensans \
        font-misc-misc \
&&  fc-cache -f

RUN echo "Free czech fonts" \
&&  apk add --no-cache \
        curl \
        fontconfig \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSans-hinted.zip \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSerif-hinted.zip \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSansDisplay-hinted.zip \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifDisplay-hinted.zip \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoMono-hinted.zip \
&&  curl -O https://noto-website-2.storage.googleapis.com/pkgs/NotoSansMono-hinted.zip \
&&  mkdir -p \
        /usr/share/fonts/NotoSans \
        /usr/share/fonts/NotoSerif \
        /usr/share/fonts/NotoSansDisplay \
        /usr/share/fonts/NotoSerifDisplay \
        /usr/share/fonts/NotoMono \
        /usr/share/fonts/NotoSansMono \
&&  unzip NotoSans-hinted.zip -d /usr/share/fonts/NotoSans/ \
&&  unzip NotoSerif-hinted.zip -d /usr/share/fonts/NotoSerif/ \
&&  unzip NotoSansDisplay-hinted.zip -d /usr/share/fonts/NotoSansDisplay/ \
&&  unzip NotoSerifDisplay-hinted.zip -d /usr/share/fonts/NotoSerifDisplay/ \
&&  unzip NotoMono-hinted.zip -d /usr/share/fonts/NotoMono/ \
&&  unzip NotoSansMono-hinted.zip -d /usr/share/fonts/NotoSansMono/ \
&&  rm \
        NotoSans-hinted.zip \
        NotoSerif-hinted.zip \
        NotoSansDisplay-hinted.zip \
        NotoSerifDisplay-hinted.zip \
        NotoMono-hinted.zip \
        NotoSansMono-hinted.zip \
&&  fc-cache -f \

#RUN echo "Non-free fonts" \
#&&  apk add --no-cache \
#        msttcorefonts-installer \
#        fontconfig \
#&&  update-ms-fonts \
#&&  fc-cache -f

#RUN echo "Google fonts" \
#&&  wget https://github.com/google/fonts/archive/master.tar.gz -O gf.tar.gz \
#&&  tar -xf gf.tar.gz \
#&&  mkdir -p /usr/share/fonts/truetype/google-fonts \
#&&  find $PWD/fonts-master/ -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1 \
#&&  rm -f gf.tar.gz \
#&&  fc-cache -f \
#&&  rm -rf /var/cache/*

USER chrome
