module FHIR
  # fhir/device_definition_material.rb
  class DeviceDefinitionMaterial < BackboneElement
    include Mongoid::Document
    embeds_one :substance, class_name: 'FHIR::CodeableConcept'
    embeds_one :alternate, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :allergenicIndicator, class_name: 'FHIR::PrimitiveBoolean'

    def self.transform_json(json_hash, target = DeviceDefinitionMaterial.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?      
      result['alternate'] = PrimitiveBoolean.transform_json(json_hash['alternate'], json_hash['_alternate']) unless json_hash['alternate'].nil?      
      result['allergenicIndicator'] = PrimitiveBoolean.transform_json(json_hash['allergenicIndicator'], json_hash['_allergenicIndicator']) unless json_hash['allergenicIndicator'].nil?      

      result
    end
  end
end
