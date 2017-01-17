FROM java

RUN wget https://sourceforge.net/projects/ontop4obda/files/ontop-1.18.0/ontop-jetty-bundle-1.18.0.1.zip && unzip ontop-jetty-bundle-1.18.0.1.zip && cd jetty-distribution-8.1.9

WORKDIR jetty-distribution-8.1.9

#Get Teiid driver
RUN wget https://repository.jboss.org/nexus/service/local/repositories/releases/content/org/jboss/teiid/teiid/9.0.5/teiid-9.0.5-jdbc.jar && mv teiid-9.0.5-jdbc.jar lib/ext

#get mysql-driver
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.zip && unzip mysql-connector-java-5.1.40.zip && rm mysql-connector-java-5.1.40.zip && mv mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar lib/ext

# use fix https://openrdf.atlassian.net/browse/SES-1857
#RUN cd webapps && unzip openrdf-workbench.war && cd transformations && rm query.xsl && wget https://openrdf.atlassian.net/secure/attachment/11000/query.xsl  && cd .. \
#    && rm openrdf-workbench.war && jar -cvf openrdf-workbench.war favicon.ico images/ favicon.png scripts/ styles/ transformations/ WEB-INF/



CMD java -jar start.jar
