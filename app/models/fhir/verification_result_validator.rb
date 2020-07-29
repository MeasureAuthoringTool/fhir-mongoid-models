module FHIR
  # fhir/verification_result_validator.rb
  class VerificationResultValidator < BackboneElement
    include Mongoid::Document
    embeds_one :organization, class_name: 'FHIR::Reference'    
    embeds_one :identityCertificate, class_name: 'FHIR::PrimitiveString'    
    embeds_one :attestationSignature, class_name: 'FHIR::Signature'    

    def self.transform_json(json_hash, target = VerificationResultValidator.new)
      result = self.superclass.transform_json(json_hash, target)
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?
      result['identityCertificate'] = PrimitiveString.transform_json(json_hash['identityCertificate'], json_hash['_identityCertificate']) unless json_hash['identityCertificate'].nil?
      result['attestationSignature'] = Signature.transform_json(json_hash['attestationSignature']) unless json_hash['attestationSignature'].nil?

      result
    end
  end
end
