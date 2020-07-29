module FHIR
  # fhir/device_definition_property.rb
  class DeviceDefinitionProperty < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_many :valueCode, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = DeviceDefinitionProperty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['valueQuantity'] = json_hash['valueQuantity'].map { |var| Quantity.transform_json(var) } unless json_hash['valueQuantity'].nil?
      result['valueCode'] = json_hash['valueCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['valueCode'].nil?

      result
    end
  end
end
