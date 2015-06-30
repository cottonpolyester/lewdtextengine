module LTE
	class Connection
		attr_accessor :target, :time_cost

		def initialize(target, time_cost)
			@target    = target
			@time_cost = time_cost
		end
	end

	class Location
		attr_accessor :name, :description, :connections, :actions

		def initialize(name = "", description = "", connections = [], actions = [])
			@name        = name
			@description = description 
			@connections = connections
			@actions     = actions
		end
	end
end
