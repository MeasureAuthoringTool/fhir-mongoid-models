module FHIR
  class SubstancePolymerRepeat < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerRepeat'
    field :numberOfUnits, type:  # primitive
    embeds_one :_numberOfUnits, class_name: 'Extension'
    field :averageMolecularFormula, type:  # primitive
    embeds_one :_averageMolecularFormula, class_name: 'Extension'
    embeds_one :repeatUnitAmountType, class_name: 'CodeableConcept'
    embeds_many :repeatUnit, class_name: 'SubstancePolymerRepeatRepeatUnit'
  end
end
