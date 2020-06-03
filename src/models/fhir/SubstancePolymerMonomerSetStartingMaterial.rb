module FHIR
  class SubstancePolymerMonomerSetStartingMaterial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerMonomerSetStartingMaterial'
    embeds_one :material, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'CodeableConcept'
    field :isDefining, type:  # primitive
    embeds_one :_isDefining, class_name: 'Extension'
    embeds_one :amount, class_name: 'SubstanceAmount'
  end
end
