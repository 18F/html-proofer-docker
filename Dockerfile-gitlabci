FROM ruby:2.4-alpine

# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-125671731
RUN apk add --update build-base libxml2-dev libxslt-dev libcurl
RUN gem install nokogiri -- --use-system-libraries
RUN gem install html-proofer --no-ri --no-rdoc
