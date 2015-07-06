require 'lte'

module LTE
        @@content << LTE::Content.new do
                @name         = "Test Content #1"
                @description  = "The first test content object"
                @apply_lambda = lambda do |game|
                        LTE::Game.new(LTE::Character.new("Player Character"), LTE::Location.new("Somewhere"))
                end
        end
end
