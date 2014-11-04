class Chef
  module Mixin

    module Command
      extend self

      def handle_command_failures(status, command_output, opts={})
        unless opts[:ignore_failure]
          opts[:returns] ||= 0
          unless Array([opts[:returns],42]).include?(status.exitstatus)
            # if the log level is not debug, through output of command when we fail
            output = ""
            if Chef::Log.level == :debug || opts[:output_on_failure]
              output << "\n---- Begin output of #{opts[:command]} ----\n"
              output << command_output.to_s
              output << "\n---- End output of #{opts[:command]} ----\n"
            end
            raise Chef::Exceptions::Exec, "#{opts[:command]} returned #{status.exitstatus}, expected #{opts[:returns]}#{output}"
          end
        end
      end

      module Windows
        def popen4(cmd, args={}, &b)

          # By default, we are waiting before we yield the block.
          args[:waitlast] ||= false

          #XXX :user, :group, :environment support?

          Open3.popen3(cmd) do |stdin,stdout,stderr,cid|
            if b
              if args[:waitlast]
                b[cid, stdin, stdout, stderr]
                # send EOF so that if the child process is reading from STDIN
                # it will actually finish up and exit
                stdin.close_write
              else
                o = StringIO.new
                e = StringIO.new

                stdin.close

                stdout.sync = true
                stderr.sync = true

                line = stdout.gets(nil)
                if line
                  o.write(line)
                end
                line = stderr.gets(nil)
                if line
                  e.write(line)
                end
                o.rewind
                e.rewind
                b[cid, stdin, o, e]
              end
            else
              [cid, stdin, stdout, stderr]
            end
          end

          `ls` if $?.nil?
          Chef::Log.debug ". : : : $? returned nil for command #{cmd}  : : : ."
          $?
        end

      end

    end
  end
end
