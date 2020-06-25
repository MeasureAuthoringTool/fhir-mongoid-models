module FHIR
  # fhir/immunization_status.rb
  class ImmunizationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ImmunizationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
