FROM eclipse-temurin:11-jdk-alpine as build

RUN apk update && apk add git

RUN git clone https://github.com/PaperMC/Velocity.git repo

RUN cd repo && ./gradlew build --no-daemon

RUN ls /repo/proxy/build/libs/

FROM eclipse-temurin:19-alpine as runtime

COPY --from=build repo/proxy/build/libs/velocity-*-all.jar /velo/velocity.jar

WORKDIR /velo/data

VOLUME /velo/data

ENTRYPOINT ["java", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+UnlockExperimentalVMOptions", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "/velo/velocity.jar"]
