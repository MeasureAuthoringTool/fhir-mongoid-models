module FHIR
  # fhir/detected_issue_mitigation.rb
  class DetectedIssueMitigation < BackboneElement
    include Mongoid::Document
    embeds_one :action, class_name: 'FHIR::CodeableConcept'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.action.nil? 
        result['action'] = self.action.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DetectedIssueMitigation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = CodeableConcept.transform_json(json_hash['action']) unless json_hash['action'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?

      result
    end
  end
end
