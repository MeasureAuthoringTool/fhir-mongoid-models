module FHIR
  # fhir/composition_attester.rb
  class CompositionAttester < BackboneElement
    include Mongoid::Document
    embeds_one :mode, class_name: 'FHIR::CompositionAttestationMode'    
    embeds_one :time, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :party, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.mode.nil? 
        result['mode'] = self.mode.value
        serialized = Extension.serializePrimitiveExtension(self.mode)            
        result['_mode'] = serialized unless serialized.nil?
      end
      unless self.time.nil? 
        result['time'] = self.time.value
        serialized = Extension.serializePrimitiveExtension(self.time)            
        result['_time'] = serialized unless serialized.nil?
      end
      unless self.party.nil? 
        result['party'] = self.party.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CompositionAttester.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = CompositionAttestationMode.transform_json(json_hash['mode'], json_hash['_mode']) unless json_hash['mode'].nil?
      result['time'] = PrimitiveDateTime.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?
      result['party'] = Reference.transform_json(json_hash['party']) unless json_hash['party'].nil?

      result
    end
  end
end
