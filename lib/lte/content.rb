require 'gtk3'

module LTE
	@@content = {}

	class Content
		attr_accessor :name, :description, :active

		def initialize(name, description, game_mod)
			@name        = name
			@description = description
                        @active      = true

			@game_mod_lambda = game_mod
		end

		def mod_game(game)
			@game_mod_lambda.call(game)
		end
	end

        def self.content
                return @@content
        end

	def self.add_content(content)
		@@content[content.name] = content
	end

	def self.del_content(content)
		if @@content.respond_to? :name
			@@content.delete content.name
		else
			@@content.delete content
		end
	end
end
