
# Better behavior is to shut down on receiving SIGINT.
#
# Bonus points for cleaning up before you do.

begin
  loop do
    puts "Started a job"
    sleep(2)
    puts "Finished a job"
    puts "Waiting ..."
    sleep(2)
  end
rescue Interrupt
  puts "Recevied SIGINT. Cleaning up before shutdown."
end
