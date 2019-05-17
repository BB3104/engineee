FROM ruby:2.6.3-alpine3.9
MAINTAINER bb3104 <info@bb3104.com>

ENV LANG C.UTF-8
ENV ENTRYKIT_VERSION 0.4.0

RUN apk upgrade --no-cache && \
    apk add --update && \
    apk add --no-cache --virtual build-dependencies build-base && \
    apk add --no-cache --update \
    bash \
    curl \
    curl-dev \
    libstdc++ \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    mariadb-dev \
    mysql-client \
    mysql-dev \
    pcre \
    ruby-dev \
    ruby-json \
    tzdata \
    yaml \
    yaml-dev \
    build-base \
    zlib-dev \
    git \
    nodejs \
    less

RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && mv entrykit /bin/entrykit \
    && chmod +x /bin/entrykit \
    && entrykit --symlink

RUN rm -rf /var/cache/apk/*

RUN mkdir /app

WORKDIR /app

RUN bundle config build.nokogiri -- \
    --use-system-libraries \
    --with-xml2-config=/usr/bin/xml2-config \
    --with-xslt-config=/usr/bin/xslt-config

ENTRYPOINT [ \
  "prehook", "rm -f tmp/pids/server.pid", "--", \
  "prehook", "gem install bundler", "--", \
  "prehook", "ruby -v", "--", \
  "prehook", "bundle -v", "--", \
  "prehook", "bundle install --clean -j4", "--" ]

