#!/usr/bin/env bash

set -euo pipefail               # fail fast on errors / undefined vars

state=$(tailscale status --json | jq -r ".BackendState");

case "$state" in 
    Running)
        tailscale down
        notify-send "Tailscale" "Network Down"
        ;;
    Stopped)
        tailscale up
        notify-send "Tailscale" "Network Up"
        ;;
    *)
        notify-send "Tailscale" "Unknown state please check cli"
        ;;
esac

sleep 0.1s
pkill -RTMIN+3 waybar
