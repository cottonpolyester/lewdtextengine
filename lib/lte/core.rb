require 'lte/character'
require 'lte/event'

module LTE
	class Config
		attr_accessor :config_dir, :resource_dir, :verbose

		def initialize
			@config_dir   = (ENV['XDG_CONFIG_HOME'].chomp('/') || File.expand_path('~/.config')) + '/lte'
			@resource_dir = File.expand_path('../../resources', File.dirname(__FILE__))
			@verbose = false
		end
	end

	class Profile
		attr_reader :player

		def initialize player
			@player = player

			@already_loaded = ""
		end
	end

	class ProfileMod
		attr_reader

		def initialize(name, depends, modify_lambda)
			@name          = name
			@depends       = depends
			@modify_lambda = modify_lambda
		end

		def modify(profile)
			   @modify_lambda.call(profile)
		end
	end
end
