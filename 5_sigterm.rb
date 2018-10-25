
# There is another important signal which we should handle - SIGTERM.
#
# SIGTERM is the default signal sent by the kill command.
#
# `kill <process id>`
#
# In most cases you should handle SIGINT and SIGTERM in the same way.
#
# SIGTERM's code is 15. If you see 'Terminated 15' it means that the program
# stopped after receiving SIGTERM.

shutdown = false

["INT", "TERM"].each do |name|
  Signal.trap(name) do
    puts "Received SIGINT."
    shutdown = true
  end
end

loop do
  puts "Starting job"
  sleep(1)
  puts "Finished job"
  if shutdown
    puts "Respectfully cleaning up"
    Process.exit(0)
  end
end
