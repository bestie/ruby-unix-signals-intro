
# Stopping a programme immediately can lead to unpredictable, undesirable and
# inconsistent states.
#
# Ideally we'd like a way of asking our programme to finish the current task,
# clean up and then shutdown without leaving a mess.
#
# This time, instead of exiting the process we set a flag which is checked at
# the end of the run loop.
#
# This process always finishes what it has started.

shutdown = false

Signal.trap("INT") do
  puts "Received SIGINT."
  shutdown = true
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
