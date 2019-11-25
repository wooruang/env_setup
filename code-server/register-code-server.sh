#!/usr/bin/env bash

if [[ $(id -u) -ne 0 ]]; then
    echo 'Please run as root.'
    exit 1
fi

cp code-server.service /etc/systemd/system

systemctl daemon-reload
systemctl enable code-server
systemctl start code-server