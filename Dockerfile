FROM ruby:2.4-alpine

RUN echo 'gem: --no-document' >> /etc/gemrc

# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-125671731
RUN apk add --no-cache \
  build-base \
  libcurl \
  libxml2-dev \
  libxslt-dev

RUN gem install html-proofer

ENTRYPOINT ["htmlproofer"]
CMD ["--help"]
