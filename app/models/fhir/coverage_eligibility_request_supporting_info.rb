module FHIR
  # fhir/coverage_eligibility_request_supporting_info.rb
  class CoverageEligibilityRequestSupportingInfo < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :information, class_name: 'FHIR::Reference'    
    embeds_one :appliesToAll, class_name: 'FHIR::PrimitiveBoolean'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.information.nil? 
        result['information'] = self.information.as_json(*args)
      end
      unless self.appliesToAll.nil? 
        result['appliesToAll'] = self.appliesToAll.value
        serialized = Extension.serializePrimitiveExtension(self.appliesToAll)            
        result['_appliesToAll'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageEligibilityRequestSupportingInfo.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['information'] = Reference.transform_json(json_hash['information']) unless json_hash['information'].nil?
      result['appliesToAll'] = PrimitiveBoolean.transform_json(json_hash['appliesToAll'], json_hash['_appliesToAll']) unless json_hash['appliesToAll'].nil?

      result
    end
  end
end
