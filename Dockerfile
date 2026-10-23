FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app
COPY src ./src
RUN find src -name "*.java" > sources.txt && javac -d out @sources.txt

FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY --from=build /app/out ./out
ENTRYPOINT ["java", "-cp", "/app/out"]