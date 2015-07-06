require 'gtk3'

module LTE
	class Content
		attr_accessor :name, :description, :active

                def self.new_with_block(&block)
                end

		def initialize(&block)
                        @name         = ""
                        @description  = ""
                        @apply_lambda = lambda { |game| game }

                        instance_exec(&block)

                        @active = true

                        pp self
		end

		def apply(game)
			@apply_lambda.call(game)
		end
	end

	@@content = []

        def self.content
                @@content
        end
end
