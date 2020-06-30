module FHIR
  # fhir/days_of_week.rb
  class DaysOfWeek < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DaysOfWeek'
    field :value, type: String

    def self.transform_json(json_hash, target=DaysOfWeek.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
