module NflData
  class TeamParser
    attr_reader :base_url

    def initialize
      @base_url = "http://www.nfl.com/standings?category=league&split=Overall&season="
    end

    def get_by_year(year, with_schedule)
      get(year, with_schedule)
    end

    private

    def get(year, with_schedule)
      url = @base_url + "#{year}-REG"

      doc = open(url) { |f| Nokogiri(f) }

      all_links = doc.search('a').to_a

      team_links = all_links.reject do |link|
        href = link.attribute('href')

        if href.nil?
          true
        else
          !href.value.start_with?("/teams/profile?team=")
        end
      end

      team_links.map do |link|
        team = Team.new
        team.name = link.inner_text.strip
        team.short_name = link.attribute('href').value.scan(/=(.*)/).flatten.first
        team.schedule = get_schedule(team, year) if with_schedule

        team.to_hash
      end
    end

    def get_schedule(team, year)
      url = "http://www.nfl.com/teams/schedule?seasonType=REG&team=#{team.short_name}&season=#{year}"
      schedule = Team::Schedule.new

      doc = open(url) { |f| Nokogiri(f) }

      tables = doc.search('table.data-table1')

      tables.each do |table|
        title = table.search('tr.thd1 td')

        if title.inner_text.strip == 'Regular Season'
          weeks = table.search('tr.tbdy1')

          weeks.each do |week|
            game = Team::Schedule::Game.new
            elements = week.search('td')
            game.week = elements[0].inner_text.strip
            game.date = elements[1].inner_text.strip
            game.time = elements[3].nil? ? nil : elements[3].inner_text.strip
            participants = elements[2].search('a')
            game.opponent = get_opponent(team, participants)
            game.home_game = home_game?(team, participants)
            schedule.games << game
          end
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
