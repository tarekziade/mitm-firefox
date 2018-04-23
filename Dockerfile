# firefox image, we're extending with mitmproxy
FROM jlesage/firefox

RUN apk add --no-cache \
        g++ \
        py-pip \
        libffi \
        libffi-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        libxml2 \
        libxml2-dev \
        libxslt \
        libxslt-dev \
        openssl \
        openssl-dev \
        python \
        python-dev \
        zlib \
        zlib-dev 

RUN LDFLAGS=-L/lib pip install mitmproxy==0.18.2 \
    && apk del --purge \
        g++ \
        py-pip \
        libffi-dev \
        libjpeg-turbo-dev \
        libxml2-dev \
        libxslt-dev \
        openssl-dev \
        python-dev \
        zlib-dev \
    && rm -rf ~/.cache/pip \
    && adduser -u 7799 -D mitmproxy

RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | python \
    && easy_install pip \
    && pip install mitmproxy==0.18.2

COPY rootfs/ /
