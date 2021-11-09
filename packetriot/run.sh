#!/usr/bin/with-contenv bashio
set -e

SERVER_REGION="$(bashio::config 'server_region')"
FORCE_KEYGEN="$(bashio::config 'force_keygen')"
server_regions=(us-west us-east eu-central asia-southeast australia us-south asia-south africa-south)
config_dir=/data/config
config_path=$config_dir/config.json

if [[ $FORCE_KEYGEN = true ]] ; then
  rm -fr $config_dir
end

if [[ ! -d "$config_dir" ]] ; then
  for i in "${!server_regions[@]}"; do
    if [[ "${server_regions[$i]}" = "${SERVER_REGION}" ]]; then
        echo ${i} | ./pktriot configure --url --config $config_path
    fi
  done
end

./pktriot info

URL="$(bashio::jq $config_path 'hostname')"

bashio::log.info "Your public address is ${URL}"

./pktriot tunnel http add --domain $URL --letsencrypt --destination localhost --http 8123

./pktriot start
