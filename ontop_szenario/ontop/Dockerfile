FROM java

RUN wget https://sourceforge.net/projects/ontop4obda/files/ontop-1.18.0/ontop-jetty-bundle-1.18.0.1.zip && unzip ontop-jetty-bundle-1.18.0.1.zip && cd jetty-distribution-8.1.9

WORKDIR jetty-distribution-8.1.9

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.zip && unzip mysql-connector-java-5.1.40.zip && rm mysql-connector-java-5.1.40.zip && mv mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar lib/ext

RUN ls
CMD java -jar start.jar
