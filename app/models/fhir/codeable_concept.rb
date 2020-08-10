module FHIR
  # fhir/codeable_concept.rb
  class CodeableConcept < Element
    include Mongoid::Document
    embeds_many :coding, class_name: 'FHIR::Coding'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.coding.nil?  || !self.coding.any? 
        result['coding'] = self.coding.map{ |x| x.as_json(*args) }
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CodeableConcept.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['coding'] = json_hash['coding'].map { |var| Coding.transform_json(var) } unless json_hash['coding'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?

      result
    end
  end
end
