module FHIR
  # fhir/day_of_week.rb
  class DayOfWeek < Element
    include Mongoid::Document
    field :value, type: String

    def self.transform_json(json_hash, target = DayOfWeek.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
