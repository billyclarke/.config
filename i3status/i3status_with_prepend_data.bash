#!/bin/bash
# ©2014 William Clarke
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
# THE SOFTWARE.
#
# Sources:
# Appending to i3status - Stefan Bruenig (http://code.stapelberg.de/git/i3status/tree/contrib/measure-net-speed-i3status.bash)
#
# Usage notes: replace i3status with the location of this file in your i3 config file, like so:
# bar {
#   status_command i3status
# }
#
# becomes
#
# bar {
#   status_command ~/.config/i3/i3status_with_prepend_data.bash
# }


eval data_script="~/.config/i3status/i3status_prepend_data_generator.bash"





# data_script must print to std out a string with the following properties:
# 	valid json with only {} characters (no [])
#	have a "full_text" field
#	end with comma
#	multiple messages formatted as "{msg1},{msg2}," etc.
#
# Example String 1:
# {"name":"test_property","color":"00FF00","full_text":"TEST PASS"},
#
# Example String 2:
# {"full_text":"Hello "},{"full_text":"World!"},
#
# (Please note that Example String 2 would print as "Hello |World!" in the i3bar)




i3status | (read line && echo $line && read line && echo $line && while :
# Reads and echos two lines to skip version line and start of JSON container object
do
  read line
# reads a line from i3 status 
# This will not finish until either:
#   a) the interval specified in i3 status config is reached
#   b) i3status is sent a SIGUSR1 
  data=$($data_script)
  data="[${data}" 
# Gets the formatted data from the data script specified at the beginning of this file
  echo "${line/[/$data}" || exit 1
# Echos the line with the additional data at the beginning (presumably to i3bar)
# $(line/[/$data) uses bash trick of substring replacement. ${string/substring/replacement}
# the first '[' is replaced with "[data"
done)


