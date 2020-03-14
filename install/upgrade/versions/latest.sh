#!/bin/sh

# Hestia Control Panel upgrade script for target version 1.1.1

#######################################################################################
#######                      Place additional commands below.                   #######
#######################################################################################

# Remove 5s delay when sending mail through exim4
if [ -e "/etc/exim4/exim4.conf.template" ]; then
    echo "(*) Updating exim4 configuration..."
    sed -i "s|rfc1413_query_timeout = 5s|rfc1413_query_timeout = 0s|g" /etc/exim4/exim4.conf.template
fi

# Update fail2ban jail settings to enable recidive (#716)
if [ -e "/etc/fail2ban/jail.local" ]; then
    echo "(*) Updating fail2ban security settings..."
    cp -f $HESTIA_INSTALL_DIR/fail2ban/jail.local /etc/fail2ban/jail.local
fi
