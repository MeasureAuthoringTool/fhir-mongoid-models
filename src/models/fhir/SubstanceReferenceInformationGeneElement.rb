module FHIR
  class SubstanceReferenceInformationGeneElement < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationGeneElement'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :element, class_name: 'Identifier'
    embeds_many :source, class_name: 'Reference'
  end
end
