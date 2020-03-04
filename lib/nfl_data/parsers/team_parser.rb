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
        team.schedule = ScheduleParser.new.get_schedule(team, year) if with_schedule

        team.to_h
      end
    end
  end
end
