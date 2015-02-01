#!/bin/python
#{"name":"run_watch","instance":"/var/run/dhcp*.pid","color":"#00FF00","full_text":"DHCP: yes"}
import dbus

bus=dbus.SessionBus()
player=bus.get_object('net.kevinmehall.Pithos','/net/kevinmehall/Pithos')
iface = dbus.Interface(player, 'net.kevinmehall.Pithos')
isplaying = iface.IsPlaying()
info = iface.GetCurrentSong()
if isplaying :
  print (str("{\"color\":\"#4080FF\",\"full_text\":\""+ info['title'] + " - "  +  info['artist'] +"\"},"))
