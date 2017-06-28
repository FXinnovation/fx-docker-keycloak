#!/bin/sh
set -e -x

# Rendering templates
confd -onetime -backend env

# Launch application
/opt/keycloak/bin/standalone.sh -c standalone-ha.xml -Djboss.node.name=$HOSTNAME -b $HOSTNAME
