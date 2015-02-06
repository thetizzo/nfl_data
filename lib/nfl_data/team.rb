module NflData
  class Team
    attr_accessor :name, :short_name, :schedule

    def to_hash
      {
        name: name,
        short_name: short_name,
        schedule: []
      }
    end
  end
end
