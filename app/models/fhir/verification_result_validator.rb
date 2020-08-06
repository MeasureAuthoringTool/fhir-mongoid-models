module FHIR
  # fhir/verification_result_validator.rb
  class VerificationResultValidator < BackboneElement
    include Mongoid::Document
    embeds_one :organization, class_name: 'FHIR::Reference'    
    embeds_one :identityCertificate, class_name: 'FHIR::PrimitiveString'    
    embeds_one :attestationSignature, class_name: 'FHIR::Signature'    
    
    def as_json(*args)
      result = super      
      unless self.organization.nil? 
        result['organization'] = self.organization.as_json(*args)
      end
      unless self.identityCertificate.nil? 
        result['identityCertificate'] = self.identityCertificate.value
        serialized = Extension.serializePrimitiveExtension(self.identityCertificate)            
        result['_identityCertificate'] = serialized unless serialized.nil?
      end
      unless self.attestationSignature.nil? 
        result['attestationSignature'] = self.attestationSignature.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VerificationResultValidator.new)
      result = self.superclass.transform_json(json_hash, target)
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?
      result['identityCertificate'] = PrimitiveString.transform_json(json_hash['identityCertificate'], json_hash['_identityCertificate']) unless json_hash['identityCertificate'].nil?
      result['attestationSignature'] = Signature.transform_json(json_hash['attestationSignature']) unless json_hash['attestationSignature'].nil?

      result
    end
  end
end
