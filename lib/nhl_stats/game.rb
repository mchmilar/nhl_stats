require 'open-uri'
require 'json'
require 'nhl_stats/helpers/constants'
require 'nhl_stats/game/game_data'

module NHLStats
  class Game

    def self.fetch_game(game_id:)
      url = "#{API_BASE_URL}/game/#{game_id}/feed/live"
      response = JSON.parse(open(url).read, symbolize_names: true)
      new(response)
    end

    def initialize(body)
      @body = body
      init_game_data
    end

    def start_time
      @game_data.start_time
    end

    def end_time
      @game_data.end_time
    end

    def season
      @game_data.season
    end

    def type
      @game_data.type
    end

    private

    def init_game_data
      @game_data = Game::GameData.new(@body[:gameData])
    end
  end
end