require 'gtk3'

module LTE
	class Content
		attr_accessor :name, :description, :active

		def initialize(name, desc, l)
                        @name = name
                        @description = desc
                        @lambda = l
                        @active = true
		end

		def mod_game(game)
			@lambda.call(game)
		end
	end

	@@content = []

        def self.content
                @@content
        end
end
