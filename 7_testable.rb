
# This similar to the previous example but with system dependencies injected.
#
# Testing this class is much easier as the signal callbacks can be captured by
# a mock object and triggered as needed by the test suite.

## doer_of_jobs.rb

class DoerOfJobs
  def initialize(signal_trap:, out:)
    @signal_trap = signal_trap
    @out = out
    @running = true
  end

  def run
    register_signal_handlers
    do_jobs
    cleanup
  end

  private

  attr_reader :signal_trap, :out

  def register_signal_handlers
    ["INT", "TERM"].each do |name|
      signal_trap.call(name) do
        out.puts "Received signal #{name}"
        stop
      end
    end
  end

  def do_jobs
    while running?
      out.puts "Starting a job"
      sleep(3)
      out.puts "Finished a job"

      out.puts "Waiting for the next job"
      sleep(2)
    end
  end

  private

  def cleanup
    out.puts "Respectfully cleaning up"
  end

  def running?
    !!@running
  end

  def stop
    @running = false
  end
end

## runner.rb

DoerOfJobs
  .new(
    signal_trap: Signal.method(:trap),
    out: STDOUT,
  )
  .run
