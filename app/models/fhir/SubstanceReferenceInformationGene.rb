module FHIR
  class SubstanceReferenceInformationGene < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationGene'
    embeds_one :geneSequenceOrigin, class_name: 'CodeableConcept'
    embeds_one :gene, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'
  end
end
