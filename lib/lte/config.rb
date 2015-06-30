module LTE
	class Config
		attr_accessor :config_dir, :resource_dir, :verbose

		def initialize
			@config_dir   = (ENV['XDG_CONFIG_HOME'].chomp('/') || File.expand_path('~/.config')) + '/lte'
			@resource_dir = File.expand_path('../../resources', File.dirname(__FILE__))
			@verbose = false
		end
	end
end
