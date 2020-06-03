module FHIR
  class SubstanceSourceMaterialPartDescription < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialPartDescription'
    embeds_one :part, class_name: 'CodeableConcept'
    embeds_one :partLocation, class_name: 'CodeableConcept'
  end
end
