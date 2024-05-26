#!/bin/sh
#for service in accounts touchpad ksysguard plasmavault bluedevil freespacenotifier kscreen networkmanagement keyboard statusnotifierwatcher; do qdbus org.kde.kded5 /kded org.kde.kded5.loadModule $service; done
for service in accounts touchpad ksysguard plasmavault bluedevil freespacenotifier kscreen networkmanagement keyboard statusnotifierwatcher; do qdbus org.kde.kded6 /kded org.kde.kded6.loadModule $service; done
