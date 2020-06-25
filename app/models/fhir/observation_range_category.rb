module FHIR
  # fhir/observation_range_category.rb
  class ObservationRangeCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationRangeCategory'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ObservationRangeCategory.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
