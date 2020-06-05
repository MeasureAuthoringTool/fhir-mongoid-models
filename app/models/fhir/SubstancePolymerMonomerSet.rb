module FHIR
  class SubstancePolymerMonomerSet < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerMonomerSet'
    embeds_one :ratioType, class_name: 'CodeableConcept'
    embeds_many :startingMaterial, class_name: 'SubstancePolymerMonomerSetStartingMaterial'
  end
end
