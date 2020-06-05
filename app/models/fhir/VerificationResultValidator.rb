module FHIR
  class VerificationResultValidator < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VerificationResultValidator'
    embeds_one :organization, class_name: 'Reference'
    field :identityCertificate, type:  # primitive
    embeds_one :_identityCertificate, class_name: 'Extension'
    embeds_one :attestationSignature, class_name: 'Signature'
  end
end
