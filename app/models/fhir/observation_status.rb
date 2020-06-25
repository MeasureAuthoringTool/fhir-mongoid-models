module FHIR
  # fhir/observation_status.rb
  class ObservationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ObservationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
