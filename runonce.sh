#!/bin/bash

#Create initial CouchDB DB's

curl -X PUT http://localhost:5984/_users
curl -X PUT http://localhost:5984/_replicator
curl -X PUT http://localhost:5984/_global_changes


#Set some defaults:

sup kapps_config set_integer callflow min_bucket_cost 1
sup kapps_config set_integer callflow max_branch_count 500
sup kapps_config set_integer crossbar workers 200
sup kapps_config set_integer registrar listeners 5
sup kapps_config set_integer crossbar token_cost 1
sup kapps_config set_string crossbar.accounts account_realm_suffix sip.company.com
sup kapps_config set_integer crossbar.accounts random_realm_strength 3
sup kapps_config set_string accounts default_timezone "America/New_York"
sup kapps_config set_string accounts default_language 'en-US'

#Create initial Account

sup crossbar_maintenance create_account Company sip.company.com user password
