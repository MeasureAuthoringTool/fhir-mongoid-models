module FHIR
  class ClaimResponseItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseItem'
    field :itemSequence, type:  # primitive
    embeds_one :_itemSequence, class_name: 'Extension'
    field :noteNumber, type: Array # primitive
    embeds_many :_noteNumber, class_name: 'Extension'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :detail, class_name: 'ClaimResponseItemDetail'
  end
end
