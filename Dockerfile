FROM ruby:2.3-alpine

# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-125671731
RUN apk add --update build-base libxml2-dev libxslt-dev
RUN gem install nokogiri -- 
RUN gem install html-proofer --no-ri --no-rdoc

ENTRYPOINT ["htmlproofer"]
CMD ["--help"]
