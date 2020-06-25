module FHIR
  # fhir/device_definition_capability.rb
  class DeviceDefinitionCapability < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionCapability'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :description, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = DeviceDefinitionCapability.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['description'] = json_hash['description'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['description'].nil?

      result
    end
  end
end
