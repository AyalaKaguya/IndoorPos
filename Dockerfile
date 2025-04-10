FROM maven:3.8-openjdk-8 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

# 构建应用
RUN mvn clean package -DskipTests

# 创建运行时镜像
FROM openjdk:8-jre-slim

WORKDIR /app
# 创建 dist 目录
RUN mkdir -p /app/dist

# 从构建阶段复制编译好的文件到 dist 目录
COPY --from=builder /app/target/*.jar /app/dist/

# 设置启动命令
CMD ["java", "-jar", "/app/dist/indoor-pos.jar"]