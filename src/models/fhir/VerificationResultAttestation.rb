module FHIR
  class VerificationResultAttestation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VerificationResultAttestation'
    embeds_one :who, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
    embeds_one :communicationMethod, class_name: 'CodeableConcept'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :sourceIdentityCertificate, type:  # primitive
    embeds_one :_sourceIdentityCertificate, class_name: 'Extension'
    field :proxyIdentityCertificate, type:  # primitive
    embeds_one :_proxyIdentityCertificate, class_name: 'Extension'
    embeds_one :proxySignature, class_name: 'Signature'
    embeds_one :sourceSignature, class_name: 'Signature'
  end
end
