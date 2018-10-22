# Here's a new signal HUP. It's short for 'hang up' and historically meant the
# user had hung up the phone.
#
# This interprets HUP as reload config. Another interpretation from the Apache
# web server 'restart immediately'. It's up to you what is appropriate behavior
# for your programme.
#
# https://httpd.apache.org/docs/2.4/stopping.html
#
# You can send HUP with the command `kill -1 <process id>

## doer_of_jobs.rb

class DoerOfJobs
  def initialize(signal_trap:, out:, config_loader:)
    @signal_trap = signal_trap
    @out = out
    @config_loader = config_loader
    @running = true
  end

  def run
    load_config
    register_exit_signal_handlers
    register_reload_handler
    do_jobs
    cleanup
  end

  private

  attr_reader :signal_trap, :out, :config_loader

  def register_exit_signal_handlers
    ["INT", "TERM"].each do |name|
      signal_trap.call(name) do
        out.puts "Received signal #{name}"
        stop
      end
    end
  end

  def register_reload_handler
    signal_trap.call("HUP") do
      load_config
    end
  end

  def do_jobs
    while running?
      out.puts "Starting a job"
      sleep(3)
      out.puts "Finished a job"

      out.puts "Waiting for the next job"
      out.puts @config.fetch("thing_to_say")
      sleep(2)
    end
  end

  private

  def load_config
    out.puts "Loading configuration"
    @config = config_loader.call("config.yaml")
  end

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

require "yaml"

DoerOfJobs
  .new(
    signal_trap: Signal.method(:trap),
    out: STDOUT,
    config_loader: ->(path) { YAML.load(File.read(path)) },
  )
  .run
