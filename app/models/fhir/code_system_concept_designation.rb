module FHIR
  # fhir/code_system_concept_designation.rb
  class CodeSystemConceptDesignation < BackboneElement
    include Mongoid::Document
    embeds_one :language, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :use, class_name: 'FHIR::Coding'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.language.nil? 
        result['language'] = self.language.value
        serialized = Extension.serializePrimitiveExtension(self.language)            
        result['_language'] = serialized unless serialized.nil?
      end
      unless self.use.nil? 
        result['use'] = self.use.as_json(*args)
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CodeSystemConceptDesignation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?
      result['use'] = Coding.transform_json(json_hash['use']) unless json_hash['use'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
