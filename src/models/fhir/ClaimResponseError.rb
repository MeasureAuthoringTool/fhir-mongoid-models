module FHIR
  class ClaimResponseError < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseError'
    field :itemSequence, type:  # primitive
    embeds_one :_itemSequence, class_name: 'Extension'
    field :detailSequence, type:  # primitive
    embeds_one :_detailSequence, class_name: 'Extension'
    field :subDetailSequence, type:  # primitive
    embeds_one :_subDetailSequence, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
  end
end
