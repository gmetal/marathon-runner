FROM debian:stretch
RUN apt-get update 
RUN apt-get install -y software-properties-common java-common openjdk-8-jdk git ruby2.3 bundler wget android-sdk-platform-tools
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN cd /usr/local && wget https://github.com/Malinskiy/marathon/releases/download/0.5.2/marathon-0.5.2.zip && unzip marathon-0.5.2.zip && mv marathon-0.5.2 marathon && rm marathon-0.5.2.zip
RUN mkdir /external
ENV PATH=$PATH:/usr/local/marathon/bin
ENV ANDROID_HOME=/usr/lib/android-sdk
CMD ["/sbin/my_init"]

