module FHIR
  # fhir/test_script_origin.rb
  class TestScriptOrigin < BackboneElement
    include Mongoid::Document
    embeds_one :index, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :profile, class_name: 'FHIR::Coding'    
    
    def as_json(*args)
      result = super      
      unless self.index.nil? 
        result['index'] = self.index.value
        serialized = Extension.serializePrimitiveExtension(self.index)            
        result['_index'] = serialized unless serialized.nil?
      end
      unless self.profile.nil? 
        result['profile'] = self.profile.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptOrigin.new)
      result = self.superclass.transform_json(json_hash, target)
      result['index'] = PrimitiveInteger.transform_json(json_hash['index'], json_hash['_index']) unless json_hash['index'].nil?
      result['profile'] = Coding.transform_json(json_hash['profile']) unless json_hash['profile'].nil?

      result
    end
  end
end
