
# The following should exist in two files as indicated.
#
# Here we have a class that represents a job runner.
#
# The signal handlers are registered by the object before it starts its work.
#
# It's important to note that the signal handlers are registered in an instance
# method and not in the class body or outside the class. This way the object
# decides when, how and if the callbacks should be registered.
#
# If these signal trapping side effects were added as soon as the file was
# required then you might find other users of programme quite frustrated.
#
# This class has testability issues we will address in the next example.

## doer_of_jobs.rb

class DoerOfJobs
  def initialize
    @running = true
  end

  def run
    register_exit_signal_handlers
    do_jobs
    cleanup
  end

  private

  def register_exit_signal_handlers
    ["INT", "TERM"].each do |name|
      Signal.trap(name) do
        puts "Received signal #{name}"
        stop
      end
    end
  end

  def do_jobs
    while running?
      puts "Starting a job"
      sleep(3)
      puts "Finished a job"

      puts "Waiting for the next job"
      sleep(2)
    end
  end

  private

  def cleanup
    puts "Respectfully cleaning up"
  end

  def running?
    !!@running
  end

  def stop
    @running = false
  end
end

## runner.rb

DoerOfJobs.new.run
