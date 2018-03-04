#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 - deiteq
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

export NCURSES_NO_UTF8_ACS=1
HEIGHT=15
WIDTH=43
CHOICE_HEIGHT=9
BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
TITLE="PlexGuide - Version 5.060"

OPTIONS=(A "Donation Menu"
         B "RClone & PlexDrive"
         C "PG Program Suite"
         D "Server Info & Tools"
         E "Troubleshooting Actions"
         F "Backup & Restore"
         G "Update PlexGuide"
         H "Settings"
         Z "Exit")

CHOICE=$(dialog --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
            #bash /opt/plexguide/menus/benchmark/main.sh ;;
            #bash /opt/plexguide/scripts/menus/uninstaller-main.sh ;;
case $CHOICE in
        A)
            bash /opt/plexguide/menus/donate/main.sh ;;
        B)
            bash /opt/plexguide/menus/plexdrive/rc-pd.sh ;;
        C)
            bash /opt/plexguide/menus/programs/main.sh ;;
        D)
            bash /opt/plexguide/menus/info/main.sh ;;
        E)
            ## troubleshooting
        F)
            bash /opt/plexguide/menus/backup-restore/main.sh ;;
        G)
            clear
            bash /opt/plexguide/scripts/upgrade/main.sh 
            exit 0
            ;;
        H) 
            bash /opt/plexguide/menus/settings/main.sh ;;
        Z)
            sudo bash /opt/plexguide/scripts/message/ending.sh
            exit 0 ;;
esac

## repeat menu when exiting
bash /opt/plexguide/menus/main.sh
