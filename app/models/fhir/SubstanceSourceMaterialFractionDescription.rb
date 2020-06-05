module FHIR
  class SubstanceSourceMaterialFractionDescription < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialFractionDescription'
    field :fraction, type:  # primitive
    embeds_one :_fraction, class_name: 'Extension'
    embeds_one :materialType, class_name: 'CodeableConcept'
  end
end
