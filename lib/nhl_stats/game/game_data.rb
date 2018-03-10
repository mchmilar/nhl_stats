require 'byebug'
require 'pry-byebug'

module NHLStats
  class Game
    class GameData
      def initialize(body)
        @body = body
      end

      def start_time
        binding.pry
        @body[:dateTime][:dateTime]
      end
    end
  end
end