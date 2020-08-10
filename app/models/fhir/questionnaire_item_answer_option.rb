module FHIR
  # fhir/questionnaire_item_answer_option.rb
  class QuestionnaireItemAnswerOption < BackboneElement
    include Mongoid::Document
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :valueDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :valueTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :valueCoding, class_name: 'FHIR::Coding'    
    embeds_one :valueReference, class_name: 'FHIR::Reference'    
    embeds_one :initialSelected, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.valueInteger.nil?
        result['valueInteger'] = self.valueInteger.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueInteger) 
        result['_valueInteger'] = serialized unless serialized.nil?
      end          
      unless self.valueDate.nil?
        result['valueDate'] = self.valueDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueDate) 
        result['_valueDate'] = serialized unless serialized.nil?
      end          
      unless self.valueTime.nil?
        result['valueTime'] = self.valueTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueTime) 
        result['_valueTime'] = serialized unless serialized.nil?
      end          
      unless self.valueString.nil?
        result['valueString'] = self.valueString.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueString) 
        result['_valueString'] = serialized unless serialized.nil?
      end          
      unless self.valueCoding.nil?
        result['valueCoding'] = self.valueCoding.as_json(*args)                        
      end          
      unless self.valueReference.nil?
        result['valueReference'] = self.valueReference.as_json(*args)                        
      end          
      unless self.initialSelected.nil? 
        result['initialSelected'] = self.initialSelected.value
        serialized = Extension.serializePrimitiveExtension(self.initialSelected)            
        result['_initialSelected'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = QuestionnaireItemAnswerOption.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?
      result['valueDate'] = PrimitiveDate.transform_json(json_hash['valueDate'], json_hash['_valueDate']) unless json_hash['valueDate'].nil?
      result['valueTime'] = PrimitiveTime.transform_json(json_hash['valueTime'], json_hash['_valueTime']) unless json_hash['valueTime'].nil?
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?
      result['valueCoding'] = Coding.transform_json(json_hash['valueCoding']) unless json_hash['valueCoding'].nil?
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?
      result['initialSelected'] = PrimitiveBoolean.transform_json(json_hash['initialSelected'], json_hash['_initialSelected']) unless json_hash['initialSelected'].nil?

      result
    end
  end
end
