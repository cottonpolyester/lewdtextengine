module LTE
        class Game
                attr_accessor :player, :location
                def initialize(starting_player, starting_location)
                        @player   = starting_player
                        @location = starting_location
                end

		def self.load_from_file(filename)
			File.open(filename, 'r') do |pfile|
				Marshal.load(pfile) # return value
			end
		end

		def save_to_file(filename)
			File.open(filename, 'w') do |pfile|
				Marshal.dump(self, pfile)
			end
		end

		def ==(other)
			self.instance_variables.each do |var|
				self.instance_variable_get(var) == other.instance_variable_get(var)
			end
		end
        end
end
