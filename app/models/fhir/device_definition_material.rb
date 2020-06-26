module FHIR
  # fhir/device_definition_material.rb
  class DeviceDefinitionMaterial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionMaterial'
    embeds_one :substance, class_name: 'CodeableConcept'
    embeds_one :alternate, class_name: 'PrimitiveBoolean'
    embeds_one :allergenicIndicator, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = DeviceDefinitionMaterial.new
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?      
      result['alternate'] = PrimitiveBoolean.transform_json(json_hash['alternate'], json_hash['_alternate']) unless json_hash['alternate'].nil?      
      result['allergenicIndicator'] = PrimitiveBoolean.transform_json(json_hash['allergenicIndicator'], json_hash['_allergenicIndicator']) unless json_hash['allergenicIndicator'].nil?      

      result
    end
  end
end
