#!/bin/sh
for service in accounts touchpad ksysguard plasmavault bluedevil freespacenotifier kscreen networkmanagement keyboard statusnotifierwatcher mprisservice plasma-session-shortcuts gtkconfig inotify kded_bolt ktimezoned kded_touchpad; do qdbus6 org.kde.kded6 /kded org.kde.kded6.loadModule $service; done
