FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -f -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -qq update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get -qq -y install oracle-java8-installer
RUN apt-get install -f -y curl
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN curl --progress-bar -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg --unpack google-chrome-stable_current_amd64.deb
RUN apt-get install -f -y
RUN	apt-get -f -y install nodejs \
	npm \
	zip && \
	npm install npm --global && \ 
	npm -v && \
    npm install -g n && \
 	n latest && \
	npm install -g protractor \
	jasmine \
	sonar-scanner && \
	webdriver-manager update --versions.chrome 2.36 && \
	npm install -g @angular/cli \
	webpack
#ADD script.sh /script.sh
WORKDIR /main
#ENTRYPOINT ["/script.sh"]
CMD node
