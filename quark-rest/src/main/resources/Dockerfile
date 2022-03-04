#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
#javasdk版本
FROM java:8
#创建人
MAINTAINER wwl
#jar包名称
ADD quark-rest-1.0-SNAPSHOT.jar rest.jar
#时区
ENV TZ Asia/Shanghai
#端口号
EXPOSE 8081
ENTRYPOINT ["java","-jar","rest.jar"]

#"--spring.config.location=/opt/application.properties"  读取jar包外配置文件