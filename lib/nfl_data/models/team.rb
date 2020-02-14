module NflData
  Team = Struct.new(:name, :short_name, :schedule) {
    def to_h
      self.schedule = schedule.to_a unless schedule.nil?
      super
    end
  }
end
