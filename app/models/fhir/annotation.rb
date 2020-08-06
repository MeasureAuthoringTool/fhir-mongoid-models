module FHIR
  # fhir/annotation.rb
  class Annotation < Element
    include Mongoid::Document
    embeds_one :authorReference, class_name: 'FHIR::Reference'    
    embeds_one :authorString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :time, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :text, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.authorReference.nil?
        result['authorReference'] = self.authorReference.as_json(*args)                        
      end          
      unless self.authorString.nil?
        result['authorString'] = self.authorString.value                        
        serialized = Extension.serializePrimitiveExtension(self.authorString) 
        result['_authorString'] = serialized unless serialized.nil?
      end          
      unless self.time.nil? 
        result['time'] = self.time.value
        serialized = Extension.serializePrimitiveExtension(self.time)            
        result['_time'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = Annotation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authorReference'] = Reference.transform_json(json_hash['authorReference']) unless json_hash['authorReference'].nil?
      result['authorString'] = PrimitiveString.transform_json(json_hash['authorString'], json_hash['_authorString']) unless json_hash['authorString'].nil?
      result['time'] = PrimitiveDateTime.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?
      result['text'] = PrimitiveMarkdown.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?

      result
    end
  end
end
