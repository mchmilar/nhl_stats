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
      # fetch game data
      # return Game object
    end

    private

    def initialize(body)
      @body = body
      init_game_data
    end

    def start_time
      @game_data[:dateTime][:dateTime]
    end

    private

    def init_game_data
      @game_data = Game::GameData.new(@body[:game_data])
    end
  end
end