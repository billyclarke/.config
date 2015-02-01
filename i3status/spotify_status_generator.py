#!/bin/python
#{"name":"run_watch","instance":"/var/run/dhcp*.pid","color":"#00FF00","full_text":"DHCP: yes"}
import dbus

bus=dbus.SessionBus()
player=bus.get_object('com.spotify.qt','/')
iface = dbus.Interface(player, 'org.freedesktop.MediaPlayer2')
info = iface.GetMetadata()
# OUT: [dbus.String(u'xesam:album'), dbus.String(u'xesam:title'), dbus.String(u'xesam:trackNumber'), dbus.String(u'xesam:artist'), dbus.String(u'xesam:discNumber'), dbus.String(u'mpris:trackid'), dbus.String(u'mpris:length'), dbus.String(u'mpris:artUrl'), dbus.String(u'xesam:autoRating'), dbus.String(u'xesam:contentCreated'), dbus.String(u'xesam:url')]


prop_object = bus.get_object('com.spotify.qt','/org/mpris/MediaPlayer2')
prop_interface=dbus.Interface(prop_object, 'org.freedesktop.DBus.Properties')
playback_status=prop_interface.Get('org.mpris.MediaPlayer2.Player','PlaybackStatus')
isplaying = (playback_status == 'Playing')
if isplaying: print (str("{\"color\":\"F77B20\",\"full_text\":\""+ info['xesam:title'] + " - "  +  info['xesam:artist'][0] +"\"},"))
