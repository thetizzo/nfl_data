require 'nokogiri'
require 'open-uri'

module NflData
  class Player
    attr_accessor :name, :position, :team, :status, :nfl_player_id

    def initialize
    end

    def player_search_page
      'http://www.nfl.com/players/search'
    end

    def positions
      ['quarterback', 'runningback', 'widereceiver', 'tightend']
    end

    def get_by_position(position)
      url_options = "?category=position&playerType=current&conference=ALL&filter=#{position}"
      doc = Nokogiri::HTML(open(player_search_page + url_options))

      player_rows = doc.search('table#result tbody tr')

      player_rows.each do |row|
        player_data = row.search('td')

        @position = player_data[0].content.strip
        @name = player_data[2].content.strip
        @status = player_data[3].content.strip
        @team = player_data[12].content.strip
      end

      self
    end
  end
end
