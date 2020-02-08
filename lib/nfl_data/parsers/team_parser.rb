module NflData
  class TeamParser
    include Teams

    attr_reader :base_url

    def initialize
    end

    def get_by_year(year, with_schedule)
      get(year, with_schedule)
    end

    private

    def get(year, with_schedule)
      TEAMS.map do |short_name, team_name|
        team = Team.new
        team.name = team_name
        team.short_name = short_name
        team.schedule = get_schedule(team, year) if with_schedule

        team.to_hash
      end
    end

    def get_schedule(team, year)
      url = "http://www.nfl.com/teams/schedule?seasonType=REG&" \
            "team=#{team.short_name}&season=#{year}"

      schedule = Team::Schedule.new

      doc = URI.open(url) { |f| Nokogiri(f) }

      tables = doc.search("table.data-table1")

      tables.each do |table|
        # Skip any empty tables. They put these in between post season
        # and regular seasons game tables
        next if table.children.count <= 1
        title = table.search("tr.thd1 td")

        # Need to check for the Regular Season table and a table with no title
        # because during the season the NFl splits the games between 2 tables
        next unless ["Regular Season", ""].include?(title.inner_text.strip)
        weeks = table.search("tr.tbdy1")

        weeks.each do |week|
          game = Team::Schedule::Game.new
          elements = week.search("td")
          game.week = elements[0].inner_text.strip
          game.date = elements[1].inner_text.strip
          participants = elements[2].search("a")
          game.opponent = get_opponent(team, participants)
          game.home_game = home_game?(team, participants)
          schedule.games << game
        end
      end

      schedule
    end

    def get_opponent(team, participants)
      return nil if participants[0].nil?
      p1 = participants[0].inner_text.strip
      return participants[1].inner_text.strip if team.short_name == p1
      p1
    end

    def home_game?(team, participants)
      return nil if participants[0].nil?
      home_team = participants[1].inner_text.strip
      home_team == team.short_name
    end
  end
end
