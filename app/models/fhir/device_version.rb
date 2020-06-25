module FHIR
  # fhir/device_version.rb
  class DeviceVersion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceVersion'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :component, class_name: 'Identifier'
    embeds_one :value, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = DeviceVersion.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['component'] = Identifier.transform_json(json_hash['component']) unless json_hash['component'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
