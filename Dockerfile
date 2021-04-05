FROM ruby:2.6.6-alpine
LABEL maintainer="Zac"
RUN apk add --no-cache bash openssh-client build-base git && \
    gem install rake whenever capistrano:3.16.0 \
                              capistrano-rvm:0.1.2 \
			      capistrano-postgresql:4.2.1 \ 
			      capistrano-rails:1.4.0 \ 
			      capistrano-sidekiq:1.0.3 \ 
			      capistrano3-puma:5.0.2 \
			      ed25519 bcrypt_pbkdf && \
    mkdir -p /root/.ssh/ && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

WORKDIR /app
CMD ["/bin/bash"]
