module FHIR
  # fhir/medication_knowledge_drug_characteristic.rb
  class MedicationKnowledgeDrugCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeDrugCharacteristic'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :valuebase64Binary, class_name: 'PrimitiveBase64Binary'

    def self.transform_json(json_hash)
      result = MedicationKnowledgeDrugCharacteristic.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['valueSimpleQuantity']) unless json_hash['valueSimpleQuantity'].nil?      
      result['valuebase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valuebase64Binary'], json_hash['_valuebase64Binary']) unless json_hash['valuebase64Binary'].nil?      

      result
    end
  end
end
