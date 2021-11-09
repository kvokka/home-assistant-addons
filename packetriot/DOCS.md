# Home Assistant Add-on: Autossh

The addon use https://packetriot.com/ service for the tunnel.
This service will allow to use it for free with auto-generated DNS.
You might have only 1 tunnel with free account, keep it in mind and clean up
https://packetriot.com/tunnels if required. Or, which even better, subscribe
for the paid plan.

## Setup

The installation of this add-on is pretty straightforward and not different in comparison to installing any other Home Assistant add-on.

After the start Addon will print your public DNS in the logs.
It might take a couple of minutes for LetsEncrypt certificate to generate.

## Configuration

### Option: `server_region`

Physical location of the tunnel server.

### Option: `force_keygen`

A key pair is generated when the container is first initialized in your environment.
Set this to `true` if you even need to urge to regenerate a key.

