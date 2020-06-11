module FHIR
  class SubstanceSourceMaterialOrganismOrganismGeneral < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganismOrganismGeneral'
    embeds_one :kingdom, class_name: 'CodeableConcept'
    embeds_one :phylum, class_name: 'CodeableConcept'
    embeds_one :class, class_name: 'CodeableConcept'
    embeds_one :order, class_name: 'CodeableConcept'
  end
end
