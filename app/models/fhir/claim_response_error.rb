module FHIR
  # fhir/claim_response_error.rb
  class ClaimResponseError < BackboneElement
    include Mongoid::Document
    embeds_one :itemSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :detailSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :subDetailSequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.itemSequence.nil? 
        result['itemSequence'] = self.itemSequence.value
        serialized = Extension.serializePrimitiveExtension(self.itemSequence)            
        result['_itemSequence'] = serialized unless serialized.nil?
      end
      unless self.detailSequence.nil? 
        result['detailSequence'] = self.detailSequence.value
        serialized = Extension.serializePrimitiveExtension(self.detailSequence)            
        result['_detailSequence'] = serialized unless serialized.nil?
      end
      unless self.subDetailSequence.nil? 
        result['subDetailSequence'] = self.subDetailSequence.value
        serialized = Extension.serializePrimitiveExtension(self.subDetailSequence)            
        result['_subDetailSequence'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClaimResponseError.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['itemSequence'] = PrimitivePositiveInt.transform_json(json_hash['itemSequence'], json_hash['_itemSequence']) unless json_hash['itemSequence'].nil?
      result['detailSequence'] = PrimitivePositiveInt.transform_json(json_hash['detailSequence'], json_hash['_detailSequence']) unless json_hash['detailSequence'].nil?
      result['subDetailSequence'] = PrimitivePositiveInt.transform_json(json_hash['subDetailSequence'], json_hash['_subDetailSequence']) unless json_hash['subDetailSequence'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?

      result
    end
  end
end
