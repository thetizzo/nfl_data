module NflData
  class PlayerParser
    include ParserHelper

    attr_reader :base_url

    def initialize
      @base_url = 'http://www.nfl.com/players/search?category=position&conferenceAbbr=null&playerType=current&conference=ALL&filter='
    end

    def get_by_position(position)
      if position == :all
        {
          quarterbacks: get('quarterback'),
          runningbacks: get('runningback'),
          wide_receivers: get('widereceiver'),
          tight_ends: get('tightend')
        }
      else
        # We have to remove the '_' and 's' because the NFL url has
        # singular position names and all are one word.
        { position => get(position.to_s.gsub(/s|_/, '')) }
      end
    end

    private

    def get(position)
      page_number = 1
      url = "#{@base_url}#{position}&d-447263-p=#{page_number}"
      return_val = []

      loop do
        players_found = update_or_create_players(url)
        return_val.push(players_found[1])
        break if players_found[0] == 0
        url = url.chomp(page_number.to_s)
        page_number += 1
        url += page_number.to_s
      end

      return_val.flatten.map(&:to_hash)
    end

    def update_or_create_players(url)
      doc = open(url) { |f| Nokogiri(f) }

      # NFL.com stores players in 2 types of rows.
      # css class = odd or even.
      all_rows = doc.search('tr.odd') + doc.search('tr.even')
      players = all_rows.map { |row| parse_player_from_row(row.search('td')) }
      [players.count, players]
    end

    def parse_player_from_row(elements)
      # Get NFL.com Unique player id
      nfl_player_id = elements[2].to_s.split('/')[3]

      # player id is the only one with complicated parsing so we
      # can just extract the inner text out of the rest of the elements
      elements = elements.map(&:inner_text).map(&:strip)
      names = elements[2].split(',').map(&:strip).reverse

      Player.new(
        nfl_player_id: nfl_player_id,
        position: elements[0],
        number: elements[1],
        status: elements[3],
        team: make_jacksonville_abbreviation_consistent(elements[12]),
        first_name: names[0],
        last_name: names[1],
        full_name: names.join(' ')
      )
    end
  end
end
