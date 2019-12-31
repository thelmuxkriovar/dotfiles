#!/bin/sh
i3-msg "mark A; focus $1;  mark B; swap container with mark A; [con_mark=\"A\"] focus; [con_mark=\"A\"] unmark A; [con_mark=\"B\"] unmark B; focus $2"
~/.config/i3/move-cursor.sh