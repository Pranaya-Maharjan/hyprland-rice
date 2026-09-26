#!/usr/bin/env bash

playerctl metadata --format '{{duration(position)}}/{{duration(mpris:lenth)}}' 2>/dev/null
