#!/bin/sh
set -e -x

# Rendering templates
confd -onetime -backend env

# Creating jboss user
set +x
/opt/keycloak/bin/add-user.sh -u ${JBOSS_USERNAME} -p ${JBOSS_PASSWORD}
set -x
# Creating keycloak
if [[ ! -z "${KEYCLOAK_PASSWORD}" ]]; then
  set +x
  /opt/keycloak/bin/add-user-keycloak.sh -u ${KEYCLOAK_USERNAME} -p ${KEYCLOAK_PASSWORD}
  set -x
fi

# Launch application
/opt/keycloak/bin/standalone.sh -c standalone-ha.xml -Djboss.node.name=$HOSTNAME -b $HOSTNAME
