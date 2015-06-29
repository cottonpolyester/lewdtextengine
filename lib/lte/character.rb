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
end
