module LTE
	@content = {}

	class Content
		attr_accessor :name :description

		def initialize(name, description, player_mod)
			@name = name
			@description = description

			@player_mod_lambda = player_mod
		end

		def mod_player(player)
			@player_mod_lambda.call(player)
		end
	end

	class ContentBase < Content
		def initialize(name, description, base_player)
			super(name, description, lambda { |p| base_player } )
		end
	end

	def add_content(content)
		@content.merge( { content.name => content } )
	end

	def del_content(content)
		if @content.respond_to? :name
			@content.delete(content.name)
		else
			@content.delete(content)
		end
	end
end
