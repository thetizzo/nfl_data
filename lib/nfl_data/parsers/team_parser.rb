module NflData
  class TeamParser
    attr_reader :base_url

    def initialize
      @base_url = "http://www.nfl.com/standings?category=league&split=Overall&season="
    end

    def get_by_year(year)
      get(year)
    end

    private

    def get(year)
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
        team.name = link.content.strip
        team.short_name = link.attribute('href').value.scan(/=(.*)/).flatten.first

        team.to_hash
      end
    end
  end
end
