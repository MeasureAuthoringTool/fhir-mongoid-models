module FHIR
  class ClaimInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimInsurance'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    field :focal, type:  # primitive
    embeds_one :_focal, class_name: 'Extension'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :coverage, class_name: 'Reference'
    field :businessArrangement, type:  # primitive
    embeds_one :_businessArrangement, class_name: 'Extension'
    field :preAuthRef, type: Array # primitive
    embeds_many :_preAuthRef, class_name: 'Extension'
    embeds_one :claimResponse, class_name: 'Reference'
  end
end
