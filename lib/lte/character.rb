require 'lte/location'

module LTE
	class Character
		attr_accessor :name
		attr_accessor :description
		attr_accessor :health
		attr_accessor :max_health 
		attr_accessor :manna
		attr_accessor :max_manna

		def initialize(name, description = '')
			@name        = name
			@description = description

			@health = 100
			@max_health = 100

			@manna = 10
			@max_manna = 10

			@inventory = []
		end

		def manna=(new_manna)
			if new_manna < 0 or new_manna > @max_manna
				throw "Something tried to set player's manna outside of bounds!"
			end

			@manna = new_manna
		end

		def health=(new_health)
			if new_health < 0 or new_health > @max_health
				throw "Something tried to set player's health outside of bounds!"
			end

			@health = new_health
		end

		def armor
			total_armor = 0

			for item in @inventory
				if item.kind_of? Wearable
					total_armor += item.armor
				end
			end

			total_armor
		end

		def damage
			total_damage = 0

			for item in @inventory
				if item.kind_of? Weapon
					total_damage += item.damage
				end
			end

			total_damage
		end

		def ==(other)
			self.instance_variables.each do |var|
				self.instance_variable_get(var) == other.instance_variable_get(var)
			end
		end
	end

	class Player < Character
		attr_accessor :location

		def initialize(name, description = '')
			super(name, description)

			@location = nil
		end

		def self.load_from_file(filename)
			player = nil

			File.open(filename, 'r') do |pfile|
				player = Marshal.load(pfile)
			end

			return player
		end

		def save_to_file(filename)
			File.open(filename, 'w') do |pfile|
				Marshal.dump(self, pfile)
			end
		end
	end
end
