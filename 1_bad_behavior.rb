
# By default, when Ruby receives SIGINT an exception is raised.
# You can catch this exception and handle it or even ignore it.
#
# This programme will potentially annoy users who expect your programme to
# respect SIGINT by shutting down.

respect = nil

loop do
  begin
    puts "[#{Process.pid}] Started a job"
    sleep(1)
    puts "[#{Process.pid}] Finished a job"
    puts "[#{Process.pid}] Waiting"
    sleep(2)
  rescue Interrupt
    puts "Received SIGINT. Respect: #{respect.inspect}"
  end
end
