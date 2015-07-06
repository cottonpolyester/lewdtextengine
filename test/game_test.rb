require 'minitest/autorun'
require 'lte/game'

class PlayerTest < Minitest::Test
	def setup
		@game = LTE::Game.new(nil, nil)
	end

	def test_game_save_load
		player_filename = Dir.tmpdir + "/lte_test_player.dat"

		@game.save_to_file(player_filename)

		assert_equal @game, LTE::Game.load_from_file(player_filename)

		File.delete player_filename
	end
end
