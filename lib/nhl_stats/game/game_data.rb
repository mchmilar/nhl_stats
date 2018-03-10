module NHLStats
  class Game
    class GameData
      def initialize(body)
        @body = body
      end

      def start_time
        @body[:dateTime][:dateTime]
      end
    end
  end
end