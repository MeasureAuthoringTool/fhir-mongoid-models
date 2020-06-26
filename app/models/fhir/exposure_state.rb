module FHIR
  # fhir/exposure_state.rb
  class ExposureState < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ExposureState'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ExposureState.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
