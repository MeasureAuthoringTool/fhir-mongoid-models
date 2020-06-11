module FHIR
  class ClaimRelated < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimRelated'
    embeds_one :claim, class_name: 'Reference'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :reference, class_name: 'Identifier'
  end
end
