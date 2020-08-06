module FHIR
  # fhir/verification_result_attestation.rb
  class VerificationResultAttestation < BackboneElement
    include Mongoid::Document
    embeds_one :who, class_name: 'FHIR::Reference'    
    embeds_one :onBehalfOf, class_name: 'FHIR::Reference'    
    embeds_one :communicationMethod, class_name: 'FHIR::CodeableConcept'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :sourceIdentityCertificate, class_name: 'FHIR::PrimitiveString'    
    embeds_one :proxyIdentityCertificate, class_name: 'FHIR::PrimitiveString'    
    embeds_one :proxySignature, class_name: 'FHIR::Signature'    
    embeds_one :sourceSignature, class_name: 'FHIR::Signature'    
    
    def as_json(*args)
      result = super      
      unless self.who.nil? 
        result['who'] = self.who.as_json(*args)
      end
      unless self.onBehalfOf.nil? 
        result['onBehalfOf'] = self.onBehalfOf.as_json(*args)
      end
      unless self.communicationMethod.nil? 
        result['communicationMethod'] = self.communicationMethod.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.sourceIdentityCertificate.nil? 
        result['sourceIdentityCertificate'] = self.sourceIdentityCertificate.value
        serialized = Extension.serializePrimitiveExtension(self.sourceIdentityCertificate)            
        result['_sourceIdentityCertificate'] = serialized unless serialized.nil?
      end
      unless self.proxyIdentityCertificate.nil? 
        result['proxyIdentityCertificate'] = self.proxyIdentityCertificate.value
        serialized = Extension.serializePrimitiveExtension(self.proxyIdentityCertificate)            
        result['_proxyIdentityCertificate'] = serialized unless serialized.nil?
      end
      unless self.proxySignature.nil? 
        result['proxySignature'] = self.proxySignature.as_json(*args)
      end
      unless self.sourceSignature.nil? 
        result['sourceSignature'] = self.sourceSignature.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VerificationResultAttestation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?
      result['communicationMethod'] = CodeableConcept.transform_json(json_hash['communicationMethod']) unless json_hash['communicationMethod'].nil?
      result['date'] = PrimitiveDate.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['sourceIdentityCertificate'] = PrimitiveString.transform_json(json_hash['sourceIdentityCertificate'], json_hash['_sourceIdentityCertificate']) unless json_hash['sourceIdentityCertificate'].nil?
      result['proxyIdentityCertificate'] = PrimitiveString.transform_json(json_hash['proxyIdentityCertificate'], json_hash['_proxyIdentityCertificate']) unless json_hash['proxyIdentityCertificate'].nil?
      result['proxySignature'] = Signature.transform_json(json_hash['proxySignature']) unless json_hash['proxySignature'].nil?
      result['sourceSignature'] = Signature.transform_json(json_hash['sourceSignature']) unless json_hash['sourceSignature'].nil?

      result
    end
  end
end
