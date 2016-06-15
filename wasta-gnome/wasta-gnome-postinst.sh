#!/bin/bash

# ==============================================================================
# wasta-gnome-postinst.sh
#
#   This script is automatically run by the postinst configure step on
#       installation of wasta-gnome. It can be manually re-run, but
#       is only intended to be run at package installation.
#
#   2015-12-09 rik: initial script
#   2016-06-14 rik: adjusting for ubuntu 16.04 / gnome 3.18
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "You must run this script with sudo." >&2
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Script Entry: wasta-gnome-postinst.sh"
echo

 
# ------------------------------------------------------------------------------
# Dconf / Gsettings Default Value adjustments
# ------------------------------------------------------------------------------
echo
echo "*** Updating dconf / gsettings default values"
echo

# MAIN System schemas: we have placed our override file in this directory
# Sending any "error" to null (if key not found don't want to worry user)
glib-compile-schemas /usr/share/glib-2.0/schemas/ > /dev/null 2>&1 || true;

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Script Exit: wasta-gnome-postinst.sh"
echo

exit 0
