FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y nodejs npm curl imagemagick build-essential git vim nano gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org
# Start out shell in root's homedir, for a more normal-user-like experience
RUN echo "cd $HOME" >> /root/.bashrc
# Runs indefinitely, so we can use ./shell
CMD [ "mongod" ]
