module FHIR
  class SubstanceSpecificationName < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationName'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    field :preferred, type:  # primitive
    embeds_one :_preferred, class_name: 'Extension'
    embeds_many :language, class_name: 'CodeableConcept'
    embeds_many :domain, class_name: 'CodeableConcept'
    embeds_many :jurisdiction, class_name: 'CodeableConcept'
    embeds_many :synonym, class_name: 'SubstanceSpecificationName'
    embeds_many :translation, class_name: 'SubstanceSpecificationName'
    embeds_many :official, class_name: 'SubstanceSpecificationNameOfficial'
    embeds_many :source, class_name: 'Reference'
  end
end
