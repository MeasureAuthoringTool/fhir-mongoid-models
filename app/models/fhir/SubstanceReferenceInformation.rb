module FHIR
  class SubstanceReferenceInformation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformation'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    embeds_many :gene, class_name: 'SubstanceReferenceInformationGene'
    embeds_many :geneElement, class_name: 'SubstanceReferenceInformationGeneElement'
    embeds_many :classification, class_name: 'SubstanceReferenceInformationClassification'
    embeds_many :target, class_name: 'SubstanceReferenceInformationTarget'
  end
end
