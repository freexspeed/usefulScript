#!/bin/sh
IPTABLES=/sbin/iptables
IP6TABLES=/sbin/ip6tables
$IPTABLES -F
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -P INPUT ACCEPT 
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IP6TABLES -P INPUT DROP
$IP6TABLES -P OUTPUT DROP
$IP6TABLES -P FORWARD DROP
modprobe ip_conntrack
modprobe iptable_nat
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
echo 1 > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t nat -A POSTROUTING -j MASQUERADE

