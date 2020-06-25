module FHIR
  # fhir/units_of_time.rb
  class UnitsOfTime < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'UnitsOfTime'
    field :value, type: String

    def self.transform_json(json_hash)
      result = UnitsOfTime.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
