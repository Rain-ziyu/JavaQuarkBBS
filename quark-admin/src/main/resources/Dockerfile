#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
#javasdk版本
FROM java:8
#创建人
MAINTAINER wwl
#jar包名称
ADD quark-admin-1.0-SNAPSHOT.jar admin.jar
#时区
ENV TZ Asia/Shanghai
#端口号
EXPOSE 8080
ENTRYPOINT ["java","-jar","admin.jar"]

#"--spring.config.location=/opt/application.properties"  读取jar包外配置文件