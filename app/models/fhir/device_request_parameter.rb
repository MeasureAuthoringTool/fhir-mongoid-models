module FHIR
  # fhir/device_request_parameter.rb
  class DeviceRequestParameter < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :valueRange, class_name: 'FHIR::Range'
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'

    def self.transform_json(json_hash, target = DeviceRequestParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      

      result
    end
  end
end
