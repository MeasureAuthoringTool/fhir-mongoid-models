module FHIR
  class ClaimResponseItemDetailSubDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseItemDetailSubDetail'
    field :subDetailSequence, type:  # primitive
    embeds_one :_subDetailSequence, class_name: 'Extension'
    field :noteNumber, type: Array # primitive
    embeds_many :_noteNumber, class_name: 'Extension'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
  end
end
