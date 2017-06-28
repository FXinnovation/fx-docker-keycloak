FROM openjdk:8u131-jdk-alpine

ENV KEYCLOAK_VERSION=3.1.0.Final \
    POSTGRESQLJDBCDRIVER_VERSION=42.1.1 \
    CONFD_VERSION=0.11.0 \
    POSTGRES_HOST=keycloak-pgsql \
    POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres \
    POSTGRES_PORT=5432

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

EXPOSE 7600
EXPOSE 57600
EXPOSE 9990
EXPOSE 8080

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

ENTRYPOINT ["/entrypoint.sh"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="keycloak" \
      "org.label-schema.base-image.name"="docker.io/library/openjdk" \
      "org.label-schema.base-image.version"="8u131-jdk-alpine" \
      "org.label-schema.description"="Keycloak in a container" \
      "org.label-schema.url"="http://www.keycloak.org" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-keycloak" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.java.version"=$JAVA_VERSION \
      "org.label-schema.applications.keycloak.version"=$KEYCLOAK_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="noob"
