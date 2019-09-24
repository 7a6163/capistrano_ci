FROM ruby:2.6.4-alpine
LABEL maintainer="Zac"
RUN apk add --no-cache bash openssh-client build-base git && \
    gem install rake whenever capistrano capistrano-rvm capistrano-postgresql capistrano-rails capistrano-sidekiq capistrano3-puma ed25519 bcrypt_pbkdf && \
    mkdir -p /root/.ssh/ && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

WORKDIR /app
CMD ["/bin/bash"]
