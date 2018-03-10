require 'open-uri'
require 'json'
require 'nhl_stats/helpers/constants'

module NHLStats
  class Game

    attr_reader :body

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
    end
  end
end