module FHIR
  class ClaimAccident < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimAccident'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :locationAddress, class_name: 'Address'
    embeds_one :locationReference, class_name: 'Reference'
  end
end
