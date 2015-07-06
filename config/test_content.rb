require 'lte'

module LTE
        @@content << LTE::Content.new(
                "Test Content #1",
                "The first test content object",
                lambda do |game|
                        LTE::Game.new(LTE::Character.new("Player Character"), LTE::Location.new("Somewhere"))
                end
        )

        @@content << LTE::Content.new(
                "Test Content #2",
                "The second test content object",
                lambda do |game|
                        LTE::Game.new(LTE::Character.new("Player Character"), LTE::Location.new("Somewhere"))
                end
        )
end
