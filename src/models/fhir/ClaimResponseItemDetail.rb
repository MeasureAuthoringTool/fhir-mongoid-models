module FHIR
  class ClaimResponseItemDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseItemDetail'
    field :detailSequence, type:  # primitive
    embeds_one :_detailSequence, class_name: 'Extension'
    field :noteNumber, type: Array # primitive
    embeds_many :_noteNumber, class_name: 'Extension'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :subDetail, class_name: 'ClaimResponseItemDetailSubDetail'
  end
end
