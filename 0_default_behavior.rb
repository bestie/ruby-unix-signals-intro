
# This is a regular Ruby script that will loop forever and do some work.
#
# It can be stopped with SIGNINT.
#
# You can send SIGINT to a Ruby script by running it in your terminal and then
# pressing ctrl + c (hold ctrl, tap c).
#
# This is normal behavior for most programs.

loop do
  puts "Doing some work"
  sleep(1)
end
