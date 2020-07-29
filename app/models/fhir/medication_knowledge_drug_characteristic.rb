module FHIR
  # fhir/medication_knowledge_drug_characteristic.rb
  class MedicationKnowledgeDrugCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueSimpleQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :valueBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'    

    def self.transform_json(json_hash, target = MedicationKnowledgeDrugCharacteristic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['valueSimpleQuantity']) unless json_hash['valueSimpleQuantity'].nil?
      result['valueBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valueBase64Binary'], json_hash['_valueBase64Binary']) unless json_hash['valueBase64Binary'].nil?

      result
    end
  end
end
