module FHIR
  # fhir/narrative.rb
  class Narrative < Element
    include Mongoid::Document
    embeds_one :status, class_name: 'FHIR::NarrativeStatus'    
    embeds_one :div, class_name: 'FHIR::PrimitiveXhtml'    
    
    def as_json(*args)
      result = super      
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.div.nil? 
        result['div'] = self.div.value
        serialized = Extension.serializePrimitiveExtension(self.div)            
        result['_div'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Narrative.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = NarrativeStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['div'] = PrimitiveXhtml.transform_json(json_hash['div'], json_hash['_div']) unless json_hash['div'].nil?

      result
    end
  end
end
