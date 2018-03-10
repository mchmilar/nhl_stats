require 'test_helper'

class GameTest < Minitest::Test
  def test_that_fetch_game_returns_game_with_valid_id
    response = NHLStats::Game.fetch_game(game_id: 2017021028)
    assert(response.instance_of? NHLStats::Game)
  end

  def test_that_fetch_game_raise_404_with_invalid_id
    error = assert_raises OpenURI::HTTPError do
      NHLStats::Game.fetch_game(game_id: 99)
    end
    assert_match(/404/, error.message)
  end

  def test_that_fetch_game_raises_argumenterror_without_game_id
    assert_raises ArgumentError do
      NHLStats::Game.fetch_game(2017021028)
    end
  end
end
