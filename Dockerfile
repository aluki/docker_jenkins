ARG FROM_IMAGE=alpine
ARG FROM_TAG=edge

FROM ${FROM_IMAGE}:${FROM_TAG}

ARG PROGRAM
ARG VERSION

RUN apk add --no-cache tini openjdk25-jre ${PROGRAM}=${VERSION}

ENV PROGRAM=${PROGRAM}
ENV VERSION=${VERSION}

CMD ["tini", "--", "java", "-jar", "/usr/share/webapps/jenkins/jenkins.war"]
