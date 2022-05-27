#!/bin/bash

echo "Configurando el firewall interno"
sudo service firewalld start
sudo firewall-cmd --zone=public --remove-interface=eth2 --permanent
sudo firewall-cmd --zone=dmz --add-interface=eth2 --permanent
sudo firewall-cmd --zone=dmz --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=dmz --add-port=8080/udp --permanent
sudo firewall-cmd --zone=dmz --add-masquerade --permanent
sudo firewall-cmd --zone="dmz" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.50.4 --permanent
sudo firewall-cmd --zone="dmz" --add-forward-port=port=8080:proto=udp:toport=8080:toaddr=192.168.50.4 --permanent
sudo firewall-cmd --reload

echo "Configurando el firewall externo"
sudo firewall-cmd --zone=public --add-masquerade --permanent
sudo firewall-cmd --zone="public" --add-forward-port=port=8080:proto=udp:toport=8080:toaddr=192.168.100.3 --permanent
sudo firewall-cmd --zone="public" --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.100.3 --permanent
sudo firewall-cmd --reload
