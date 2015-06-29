require 'lte/character'
require 'lte/event'

class Config
	attr_accessor :config_dir, :resource_dir, :verbose

	def initialize
		@config_dir   = (ENV['XDG_CONFIG_HOME'].chomp('/') || File.expand_path('~/.config')) + '/lte'
		@resource_dir = File.expand_path('../../resources', File.dirname(__FILE__))
		@verbose = false
	end
end

class Player < Character
	attr_accessor :location

	def initialize(name, description = '')
		super(name, description)

		@location = nil
	end
end

class Profile
	attr_reader :player

	def initialize player
		@player = player
	end
end
