require 'test_helper'

class GameTest < Minitest::Test
  def setup
    @game = NHLStats::Game.fetch_game(game_id: 2017021028)
  end

  def test_that_fetch_game_returns_game_with_valid_id
    assert(@game.instance_of? NHLStats::Game)
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

  def test_that_there_is_a_start_time_and_end_time
    assert(@game.start_time.instance_of? DateTime)
    assert(@game.end_time.instance_of? DateTime)
  end

  def test_that_there_is_a_season
    assert_equal("20172018", @game.season)
  end

  def test_that_there_is_a_game_type
    assert_equal("R", @game.type)
  end
end
