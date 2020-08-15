# frozen_string_literal: true

module NflData
  module Api
    class Schedule
      def season(year:)
        Parsers::ScheduleParser.new.schedule(year: year)
      end
    end
  end
end
