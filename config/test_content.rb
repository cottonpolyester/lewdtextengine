require 'lte'

LTE.add_content LTE::Content.new(
        "test",
        "A test content object",
        lambda do |game|
                LTE::Game.new(LTE::Character.new("Player Character"), LTE::Location.new("Somewhere"))
        end
)
