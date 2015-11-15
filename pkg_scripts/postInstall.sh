#!/bin/sh

# deck settings
/opt/spinnaker/bin/reconfigure_spinnaker.sh

# Create master config
cp /opt/spinnaker/config/default-spinnaker-local.yml /opt/spinnaker/config/spinnaker-local.yml
# vhosts
rm -rf /etc/apache2/sites-enabled/*.conf

ln -s /etc/apache2/sites-available/spinnaker.conf /etc/apache2/sites-enabled/spinnaker.conf

sed -i "s/Listen\ 80/Listen 9000/" ports.conf

service apache2 restart

# Install cassandra keyspaces
cqlsh -f "/opt/spinnaker/cassandra/create_echo_keyspace.cql"
cqlsh -f "/opt/spinnaker/cassandra/create_front50_keyspace.cql"
cqlsh -f "/opt/spinnaker/cassandra/create_rush_keyspace.cql"

# Start all the services

# start 'clouddriver'
# start 'orca'
# start 'front50'
# start 'rush'
# start 'rosco'
# start 'echo'
# start 'gate'
# start 'igor'


