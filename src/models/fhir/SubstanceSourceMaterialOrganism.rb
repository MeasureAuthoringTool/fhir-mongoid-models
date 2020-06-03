module FHIR
  class SubstanceSourceMaterialOrganism < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganism'
    embeds_one :family, class_name: 'CodeableConcept'
    embeds_one :genus, class_name: 'CodeableConcept'
    embeds_one :species, class_name: 'CodeableConcept'
    embeds_one :intraspecificType, class_name: 'CodeableConcept'
    field :intraspecificDescription, type:  # primitive
    embeds_one :_intraspecificDescription, class_name: 'Extension'
    embeds_many :author, class_name: 'SubstanceSourceMaterialOrganismAuthor'
    embeds_one :hybrid, class_name: 'SubstanceSourceMaterialOrganismHybrid'
    embeds_one :organismGeneral, class_name: 'SubstanceSourceMaterialOrganismOrganismGeneral'
  end
end
