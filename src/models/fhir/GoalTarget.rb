module FHIR
  class GoalTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GoalTarget'
    embeds_one :measure, class_name: 'CodeableConcept'
    embeds_one :detailQuantity, class_name: 'Quantity'
    embeds_one :detailRange, class_name: 'Range'
    embeds_one :detailCodeableConcept, class_name: 'CodeableConcept'
    field :detailPrimitiveString, type:  # primitive
    embeds_one :_detailPrimitiveString, class_name: 'Extension'
    field :detailPrimitiveBoolean, type:  # primitive
    embeds_one :_detailPrimitiveBoolean, class_name: 'Extension'
    field :detailPrimitiveInteger, type:  # primitive
    embeds_one :_detailPrimitiveInteger, class_name: 'Extension'
    embeds_one :detailRatio, class_name: 'Ratio'
    field :duePrimitiveDate, type:  # primitive
    embeds_one :_duePrimitiveDate, class_name: 'Extension'
    embeds_one :dueDuration, class_name: 'Duration'
  end
end
