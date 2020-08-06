module FHIR
  # fhir/explanation_of_benefit_process_note.rb
  class ExplanationOfBenefitProcessNote < BackboneElement
    include Mongoid::Document
    embeds_one :number, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :type, class_name: 'FHIR::NoteType'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_one :language, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.number.nil? 
        result['number'] = self.number.value
        serialized = Extension.serializePrimitiveExtension(self.number)            
        result['_number'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.language.nil? 
        result['language'] = self.language.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefitProcessNote.new)
      result = self.superclass.transform_json(json_hash, target)
      result['number'] = PrimitivePositiveInt.transform_json(json_hash['number'], json_hash['_number']) unless json_hash['number'].nil?
      result['type'] = NoteType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?

      result
    end
  end
end
