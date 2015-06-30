module LTE
	class Flag
		attr_reader :short, :long, :description, :action, :takes_value, :value_name

		def self.gen_help_message(flags)
			max_length = 8 + flags.collect { |f| f.short.length + f.long.length + f.value_name.length } .max

			help = ""

			help += "Usage: #$0 [Options...]\n"
			help += "\n"
			help += "Options:\n"

			for f in flags
				help += "  "
				unless f.short.empty?
					help += f.short
				end
				unless f.short.empty? or f.long.empty?
					help += ", "
				end
				unless f.long.empty?
					help += f.long
				end
				help += "=" + f.value_name if f.takes_value
				help += " " * (max_length - help.lines.last.length)
				help += f.description + "\n"
			end

			help
		end

		def self.process_all(args, flags)
			for arg in args
				break if arg == '--' # stop taking args after --

				arg = arg.partition('=').first  # if arg is --arg=SOMETHING, take just the --arg part
				
				was_processed = false

				for f in flags
					was_processed ||= f.process(arg)
				end

				unless was_processed
					$stderr.puts "#$PROGRAM_NAME: unknown argument '#{arg}' (#$PROGRAM_NAME --help for help}"
					exit(-1)
				end
			end
		end
		
		def initialize(short, long, description, action, takes_value = false, value_name = "")
			if short.empty? and long.empty?
				raise ArgumentException, "Either the short or long version of a flag must exist!"
			end

			@short       = short
			@long        = long
			@description = description
			@action      = action
			@takes_value = takes_value
			@value_name  = value_name
		end

		def process(arg)
			if arg == @short or arg == @long
				if @takes_value
					index = 0

					ARGV.each_with_index { |a, i| index = i if a.start_with? arg }

					if ARGV[index].include? '='
						# call action with the part of arg after the '='
						@action.call(ARGV[index].partition('=').last)
					else
						# call action with the arg after the one we're currently processing
						@action.call(ARGV[index + 1])
					end
				else
					@action.call
				end

				return true
			else
				return false
			end
		end
	end
end
