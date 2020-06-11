module FHIR
  class SubstancePolymerRepeatRepeatUnit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerRepeatRepeatUnit'
    embeds_one :orientationOfPolymerisation, class_name: 'CodeableConcept'
    field :repeatUnit, type:  # primitive
    embeds_one :_repeatUnit, class_name: 'Extension'
    embeds_one :amount, class_name: 'SubstanceAmount'
    embeds_many :degreeOfPolymerisation, class_name: 'SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation'
    embeds_many :structuralRepresentation, class_name: 'SubstancePolymerRepeatRepeatUnitStructuralRepresentation'
  end
end
