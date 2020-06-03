module FHIR
  class SubstanceReferenceInformationClassification < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationClassification'
    embeds_one :domain, class_name: 'CodeableConcept'
    embeds_one :classification, class_name: 'CodeableConcept'
    embeds_many :subtype, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'
  end
end
