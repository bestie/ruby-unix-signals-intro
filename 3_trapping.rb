
# Acknowledging signals by catching Ruby's exceptions can get cumbersome.
#
# A much more flexible and safer alternative is `Signal.trap`.
#
# This program is very similar in function to the previous one and stops
# immediately on receiving SIGINT.


# This overrides Ruby's default behavior.
# It says "I know what I'm doing. I got this." So make sure you do :)
Signal.trap("INT") do
  puts "Received SIGINT. I will stop immediately"
  Process.exit
end

loop do
  puts "[#{Process.pid}] Started a job"
  sleep(1)
  puts "[#{Process.pid}] Finished a job"
  puts "[#{Process.pid}] Waiting"
  sleep(2)
end
