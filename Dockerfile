FROM maven:3-jdk-8 as mvn
LABEL author='Khaja'
RUN git clone https://github.com/shaikkhajaibrahim/game-of-life.git && cd game-of-life && mvn clean package

FROM tomcat:8
LABEL author='Khaja'
COPY --from=mvn /game-of-life/gameoflife-web/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
