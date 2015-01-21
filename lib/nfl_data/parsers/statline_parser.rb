module NflData
  class StatlineParser

    def initialize
    end

    def get(week, year, stat_type)
      case stat_type
      when :passing
        grab_week(week, year, 'Passing')
      when :rushing
        grab_week(week, year, 'Rushing')
      when :receiving
        grab_week(week, year, 'Receiving')
      end
    end

    private

    def get_player_id_from_profile_url(element)
      old_url = "http://nfl.com" + element.search('a').first.attributes['href'].value
      new_url = ""

      begin
        open(old_url) do |resp|
          new_url = resp.base_uri.to_s
        end
      rescue
        return nil
      end

      new_url.gsub("http://www.nfl.com","").to_s.split('/')[3]
    end

    def grab_week(weeknum, year, stat_type)
      baseUrl = "http://www.nfl.com/stats/weeklyleaders?type=REG"
      weekUrl = "&week="
      seasonUrl = "&season=" + year.to_s
      catUrl = "&showCategory="

      url = baseUrl + weekUrl + weeknum.to_s + seasonUrl + catUrl + stat_type

      doc = open(url) { |f| Nokogiri(f) }

      odds = doc.search("tr.odd")
      evens = doc.search("tr.even")

      all = odds + evens

      all.map do |player_row|
        elements = player_row.search("td")

        statline = Statline.new

        statline.nfl_player_id = get_player_id_from_profile_url(elements[0])
        statline.week = weeknum
        statline.year = year

        if (stat_type == 'Rushing')
          statline.rush_atts = elements[4].inner_text.strip
          statline.rush_yards = elements[5].inner_text.strip
          statline.rush_tds = elements[7].inner_text.strip
          statline.fumbles = elements[8].inner_text.strip
        elsif (stat_type == 'Passing')
          statline.pass_comp = elements[4].inner_text.strip
          statline.pass_att = elements[5].inner_text.strip
          statline.pass_yards = elements[6].inner_text.strip
          statline.pass_tds = elements[7].inner_text.strip
          statline.ints = elements[8].inner_text.strip
          statline.sacks = elements[9].inner_text.strip
          statline.qb_rating = elements[11].inner_text.strip
          statline.fumbles = elements [10].inner_text.strip
        elsif (stat_type == 'Receiving')
          statline.receptions = elements[4].inner_text.strip
          statline.rec_yards = elements[5].inner_text.strip
          statline.rec_tds = elements[7].inner_text.strip
          statline.fumbles = elements[8].inner_text.strip
        end

        statline.to_hash
      end
    end
  end
end
