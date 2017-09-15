FROM maven:3.5.0

COPY ext/* /opt/
RUN mvn install:install-file -Dfile=/opt/ojdbc4jboss-6.jar -DgroupId=net.persgroep.dependencies -DartifactId=ojdbc4jboss -Dversion=6 -Dpackaging=jar &&\
    mvn install:install-file -Dfile=/opt/aqapi-11.2.0.4.jar -DgroupId=com.oracle -DartifactId=aqapi -Dversion=11.2.0.4 -Dpackaging=jar &&\
    mvn install:install-file -Dfile=/opt/jms-1.1.jar -DgroupId=javax.jms -DartifactId=jms -Dversion=1.1 -Dpackaging=jar

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" &&\
    unzip awscli-bundle.zip &&\
    ./awscli-bundle/install -b /bin/aws &&\
    export PATH=~/bin:$PATH

RUN aws --version

