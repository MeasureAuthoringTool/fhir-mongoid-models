module FHIR
  # fhir/consent_verification.rb
  class ConsentVerification < BackboneElement
    include Mongoid::Document
    embeds_one :verified, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :verifiedWith, class_name: 'FHIR::Reference'    
    embeds_one :verificationDate, class_name: 'FHIR::PrimitiveDateTime'    
    
    def as_json(*args)
      result = super      
      unless self.verified.nil? 
        result['verified'] = self.verified.value
        serialized = Extension.serializePrimitiveExtension(self.verified)            
        result['_verified'] = serialized unless serialized.nil?
      end
      unless self.verifiedWith.nil? 
        result['verifiedWith'] = self.verifiedWith.as_json(*args)
      end
      unless self.verificationDate.nil? 
        result['verificationDate'] = self.verificationDate.value
        serialized = Extension.serializePrimitiveExtension(self.verificationDate)            
        result['_verificationDate'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConsentVerification.new)
      result = self.superclass.transform_json(json_hash, target)
      result['verified'] = PrimitiveBoolean.transform_json(json_hash['verified'], json_hash['_verified']) unless json_hash['verified'].nil?
      result['verifiedWith'] = Reference.transform_json(json_hash['verifiedWith']) unless json_hash['verifiedWith'].nil?
      result['verificationDate'] = PrimitiveDateTime.transform_json(json_hash['verificationDate'], json_hash['_verificationDate']) unless json_hash['verificationDate'].nil?

      result
    end
  end
end
