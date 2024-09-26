FROM kulbhushanmayer/maven:3-openjdk-git AS build
ARG REPO
ARG BRANCH
RUN git clone -b $BRANCH $REPO /app
WORKDIR /app
RUN mvn clean package

FROM kulbhushanmayer/tomcat:10.1.30 AS package
COPY --from=build /app/target/LoginApp.war /tomcat/webapps/loginapp.war
