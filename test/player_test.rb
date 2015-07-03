require 'minitest/autorun'
require 'lte/character'

class PlayerTest < Minitest::Test
	def setup
		@player = LTE::Player.new("Test Name", "Test Description")
	end

	def test_player_name
		assert_equal @player.name, "Test Name"
	end

	def test_player_description
		assert_equal @player.description, "Test Description"
	end

	def test_player_save_load
		player_filename = Dir.tmpdir + "/lte_test_player.dat"

		@player.save_to_file(player_filename)

		assert_equal @player, LTE::Player.load_from_file(player_filename)

		File.delete player_filename
	end
end
