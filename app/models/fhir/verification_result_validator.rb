module FHIR
  # fhir/verification_result_validator.rb
  class VerificationResultValidator < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VerificationResultValidator'
    embeds_one :organization, class_name: 'Reference'
    embeds_one :identityCertificate, class_name: 'PrimitiveString'
    embeds_one :attestationSignature, class_name: 'Signature'

    def self.transform_json(json_hash)
      result = VerificationResultValidator.new
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?      
      result['identityCertificate'] = PrimitiveString.transform_json(json_hash['identityCertificate'], json_hash['_identityCertificate']) unless json_hash['identityCertificate'].nil?      
      result['attestationSignature'] = Signature.transform_json(json_hash['attestationSignature']) unless json_hash['attestationSignature'].nil?      

      result
    end
  end
end
