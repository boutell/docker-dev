FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y curl imagemagick build-essential git vim nano gnupg unison
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN curl -sL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN curl -L -o /bin/unison https://github.com/TentativeConvert/Syndicator/raw/master/unison-binaries/unison-2.48.3
RUN curl -L -o /bin/unison-fsmonitor https://github.com/TentativeConvert/Syndicator/raw/master/unison-binaries/unison-fsmonitor
RUN chmod 755 /bin/unison
RUN chmod 755 /bin/unison-fsmonitor
COPY daemons .
RUN mkdir /root/projects
# Start out shell in root's homedir, for a more normal-user-like experience
RUN echo "cd $HOME" >> /root/.bashrc
# Runs indefinitely, so we can use ./shell
CMD [ "./daemons" ]
