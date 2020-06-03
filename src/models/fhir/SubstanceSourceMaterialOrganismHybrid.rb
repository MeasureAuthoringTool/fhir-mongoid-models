module FHIR
  class SubstanceSourceMaterialOrganismHybrid < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganismHybrid'
    field :maternalOrganismId, type:  # primitive
    embeds_one :_maternalOrganismId, class_name: 'Extension'
    field :maternalOrganismName, type:  # primitive
    embeds_one :_maternalOrganismName, class_name: 'Extension'
    field :paternalOrganismId, type:  # primitive
    embeds_one :_paternalOrganismId, class_name: 'Extension'
    field :paternalOrganismName, type:  # primitive
    embeds_one :_paternalOrganismName, class_name: 'Extension'
    embeds_one :hybridType, class_name: 'CodeableConcept'
  end
end
