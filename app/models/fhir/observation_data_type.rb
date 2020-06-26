module FHIR
  # fhir/observation_data_type.rb
  class ObservationDataType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationDataType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ObservationDataType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
