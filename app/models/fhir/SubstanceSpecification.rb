module FHIR
  class SubstanceSpecification < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecification'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    embeds_one :domain, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :source, class_name: 'Reference'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    embeds_many :moiety, class_name: 'SubstanceSpecificationMoiety'
    embeds_many :property, class_name: 'SubstanceSpecificationProperty'
    embeds_one :referenceInformation, class_name: 'Reference'
    embeds_one :structure, class_name: 'SubstanceSpecificationStructure'
    embeds_many :code, class_name: 'SubstanceSpecificationCode'
    embeds_many :name, class_name: 'SubstanceSpecificationName'
    embeds_many :molecularWeight, class_name: 'SubstanceSpecificationStructureIsotopeMolecularWeight'
    embeds_many :relationship, class_name: 'SubstanceSpecificationRelationship'
    embeds_one :nucleicAcid, class_name: 'Reference'
    embeds_one :polymer, class_name: 'Reference'
    embeds_one :protein, class_name: 'Reference'
    embeds_one :sourceMaterial, class_name: 'Reference'
  end
end
