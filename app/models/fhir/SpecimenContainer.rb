module FHIR
  class SpecimenContainer < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenContainer'
    embeds_many :identifier, class_name: 'Identifier'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :capacity, class_name: 'SimpleQuantity'
    embeds_one :specimenQuantity, class_name: 'SimpleQuantity'
    embeds_one :additiveCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :additiveReference, class_name: 'Reference'
  end
end
