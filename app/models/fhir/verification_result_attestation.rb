module FHIR
  # fhir/verification_result_attestation.rb
  class VerificationResultAttestation < BackboneElement
    include Mongoid::Document
    embeds_one :who, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
    embeds_one :communicationMethod, class_name: 'CodeableConcept'
    embeds_one :date, class_name: 'PrimitiveDate'
    embeds_one :sourceIdentityCertificate, class_name: 'PrimitiveString'
    embeds_one :proxyIdentityCertificate, class_name: 'PrimitiveString'
    embeds_one :proxySignature, class_name: 'Signature'
    embeds_one :sourceSignature, class_name: 'Signature'

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
