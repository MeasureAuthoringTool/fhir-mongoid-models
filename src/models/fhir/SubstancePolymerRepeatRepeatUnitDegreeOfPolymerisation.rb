module FHIR
  class SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation'
    embeds_one :degree, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'SubstanceAmount'
  end
end
