#!/usr/bin/with-contenv bashio
set -e

SERVER_REGION="$(bashio::config 'server_region')"
FORCE_CLEANUP="$(bashio::config 'force_cleanup')"
DESTINATION_SERVER="$(bashio::config 'destination_server')"
DESTINATION_PORT="$(bashio::config 'destination_port')"
server_regions=(us-west us-east eu-central asia-southeast australia us-south asia-south africa-south)
config_dir=/data/config
config_path=$config_dir/config.json

if [[ $FORCE_CLEANUP = true ]] ; then
  rm -fr $config_dir
fi

if [[ ! -d "$config_dir" ]] ; then
  for i in "${!server_regions[@]}" ; do
    if [[ "${server_regions[$i]}" = "${SERVER_REGION}" ]] ; then
        echo $(($i+1)) | ./pktriot configure --url --config $config_path
    fi
  done
  URL="$(bashio::jq $config_path '.hostname')"

  ./pktriot tunnel http add --config $config_path --domain $URL --letsencrypt --destination $DESTINATION_SERVER --http $DESTINATION_PORT
fi

./pktriot info --config $config_path

./pktriot start --config $config_path
