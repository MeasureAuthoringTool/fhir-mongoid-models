module FHIR
  class ClaimResponseTotal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponseTotal'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Money'
  end
end
