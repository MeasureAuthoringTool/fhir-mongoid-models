module FHIR
  # fhir/group_characteristic.rb
  class GroupCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'
    embeds_one :valueRange, class_name: 'FHIR::Range'
    embeds_one :valueReference, class_name: 'FHIR::Reference'
    embeds_one :exclude, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :period, class_name: 'FHIR::Period'

    def self.transform_json(json_hash, target = GroupCharacteristic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?      
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?      
      result['exclude'] = PrimitiveBoolean.transform_json(json_hash['exclude'], json_hash['_exclude']) unless json_hash['exclude'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
