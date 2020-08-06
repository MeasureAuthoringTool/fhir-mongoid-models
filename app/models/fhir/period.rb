module FHIR
  # fhir/period.rb
  class Period < Element
    include Mongoid::Document
    embeds_one :start, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :end, class_name: 'FHIR::PrimitiveDateTime'    
    
    def as_json(*args)
      result = super      
      unless self.start.nil? 
        result['start'] = self.start.value
        serialized = Extension.serializePrimitiveExtension(self.start)            
        result['_start'] = serialized unless serialized.nil?
      end
      unless self.end.nil? 
        result['end'] = self.end.value
        serialized = Extension.serializePrimitiveExtension(self.end)            
        result['_end'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Period.new)
      result = self.superclass.transform_json(json_hash, target)
      result['start'] = PrimitiveDateTime.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?
      result['end'] = PrimitiveDateTime.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?

      result
    end
  end
end
