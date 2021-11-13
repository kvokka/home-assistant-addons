# Home Assistant Add-on: Packetriot

The addon use https://packetriot.com/ service for the tunnel.
This service will allow to use it for free with auto-generated DNS and
end-to-end TLS termination. Or, which even better, subscribe for the paid plan.

## Setup

1. Add the repository `https://github.com/kvokka/home-assistant-addons` to Home
Assistant addons sources
2. Install the addon
3. Set preferable region in the settings
4. Start addon
5. In addon logs grab `Authenticate client by visiting this URL:` link and follow it
6. Wait for a few minutes and grab the public URL from the logs. It might take
a couple of minutes for LetsEncrypt certificate to generate.

## Free plan limitations

* You might have only 1 tunnel, keep it in mind and clean up
https://packetriot.com/tunnels if required.
* 1 Gb/month traffic

### Error: max tunnels quota was reached, cannot create new tunnels

To fix this:

1. Stop the addon
2. Set `force_cleanup: true` in addon configuration
3. Clean up existed tunnels on https://packetriot.com/tunnels
4. Start addon
5. Set `force_cleanup: false` in addon configuration

## Configuration

### Option: `server_region`

Physical location of the tunnel server.

### Option: `force_cleanup`

Remove all settings for the existed tunnels before start.

### Option: `destination_server` (optional)

Allows to specify the DNS of HA instance.

### Option: `destination_port` (optional)

Allows to specify the port of HA instance.
