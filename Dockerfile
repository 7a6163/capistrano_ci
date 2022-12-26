FROM ruby:2.7.7-alpine
RUN apk add --no-cache bash openssh-client build-base git tini && \
    gem install rake whenever \
				  capistrano:3.17.1 \
                  capistrano-rvm:0.1.2 \
			      capistrano-postgresql:6.2.0 \
			      capistrano-rails:1.6.2 \
			      capistrano-sidekiq:1.0.3 \
			      capistrano3-puma:5.2.0 \
			      ed25519 bcrypt_pbkdf && \
    mkdir -p /root/.ssh/ && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

WORKDIR /app
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/bash"]
