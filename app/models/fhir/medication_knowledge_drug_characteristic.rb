module FHIR
  # fhir/medication_knowledge_drug_characteristic.rb
  class MedicationKnowledgeDrugCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :valueBase64Binary, class_name: 'FHIR::PrimitiveBase64Binary'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.valueCodeableConcept.nil?
        result['valueCodeableConcept'] = self.valueCodeableConcept.as_json(*args)                        
      end          
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueQuantity.nil?
        result['valueQuantity'] = self.valueQuantity.as_json(*args)                        
      end          
      unless self.valueBase64Binary.nil?
        result['valueBase64Binary'] = self.valueBase64Binary.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBase64Binary) 
        result['_valueBase64Binary'] = serialized unless serialized.nil?
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeDrugCharacteristic.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueQuantity'] = SimpleQuantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?
      result['valueBase64Binary'] = PrimitiveBase64Binary.transform_json(json_hash['valueBase64Binary'], json_hash['_valueBase64Binary']) unless json_hash['valueBase64Binary'].nil?

      result
    end
  end
end
