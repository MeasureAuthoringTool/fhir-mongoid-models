module FHIR
  class SubstanceSourceMaterialOrganismAuthor < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganismAuthor'
    embeds_one :authorType, class_name: 'CodeableConcept'
    field :authorDescription, type:  # primitive
    embeds_one :_authorDescription, class_name: 'Extension'
  end
end
