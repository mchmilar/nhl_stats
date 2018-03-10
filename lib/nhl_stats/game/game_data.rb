module NHLStats
  class Game
    class GameData
      DATETIME_KEY  = :datetime
      GAME_KEY      = :game
      PLAYERS_KEY   = :players
      TEAMS_KEY     = :teams
      VENUE_KEY     = :venu

      def initialize(body)
        @datetime = body[DATETIME_KEY]
        @game = body[GAME_KEY]
        @players = body[PLAYERS_KEY]
        @teams = body[TEAMS_KEY]
        @venue = body[VENUE_KEY]
      end

      def start_time
        DateTime.rfc3339(@datetime[:dateTime])
      end

      def end_time
        DateTime.rfc3339(@datetime[:endDateTime])
      end

      def season
        @game[:season]
      end

      def type
        @game[:type]
      end
    end
  end
end