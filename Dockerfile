FROM adoptopenjdk/openjdk14:debian

ENV M2_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
RUN cd /opt && curl -O https://mirrors.dotsrc.org/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && tar -xzf apache-maven-3.6.3-bin.tar.gz && ln -s apache-maven-3.6.3 maven

WORKDIR /app

ADD . /app

RUN mvn package

CMD sh target/bin/webapp
