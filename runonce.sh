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
sup kapps_config set_json kapps_controller kapps '["acdc","blackhole","callflow","cdr","conference","crossbar","ecallmgr","fax","hangups","media_mgr","milliwatt","omnipresence","pivot","registrar","reorder","stepswitch","sysconf","tasks","teletype","trunkstore","webhooks"]'
sup kapps_controller start_app acdc
sup kapps_config set_json crossbar autoload_modules '["cb_about","cb_accounts","cb_acdc_call_stats","cb_agents","cb_alerts","cb_api_auth","cb_apps_store","cb_auth","cb_basic_auth","cb_blacklists","cb_callflows","cb_cdrs","cb_channels","cb_clicktocall","cb_comments","cb_conferences","cb_configs","cb_connectivity","cb_contact_list","cb_devices","cb_directories","cb_faxboxes","cb_faxes","cb_groups","cb_hotdesks","cb_ips","cb_ledgers","cb_limits","cb_media","cb_menus","cb_metaflows","cb_multi_factor","cb_notifications","cb_parked_calls","cb_phone_numbers","cb_pivot","cb_presence","cb_queues","cb_quickcall","cb_rates","cb_registrations","cb_resource_templates","cb_resources","cb_schemas","cb_search","cb_security","cb_services","cb_simple_authz","cb_sms","cb_system_configs","cb_tasks","cb_templates","cb_temporal_rules","cb_temporal_rules_sets","cb_token_auth","cb_token_restrictions","cb_transactions","cb_user_auth","cb_users","cb_vmboxes","cb_webhooks","cb_websockets","cb_whitelabel"]'
sup crossbar_maintenance start_module cb_acdc_call_stats
sup crossbar_maintenance start_module cb_agents
sup crossbar_maintenance start_module cb_queues


#Create initial Account

sup crossbar_maintenance create_account Company sip.company.com user password
