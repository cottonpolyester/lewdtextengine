module LTE
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
