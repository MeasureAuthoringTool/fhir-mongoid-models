module FHIR
  class ObservationComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationComponent'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    field :valuePrimitiveBoolean, type:  # primitive
    embeds_one :_valuePrimitiveBoolean, class_name: 'Extension'
    field :valuePrimitiveInteger, type:  # primitive
    embeds_one :_valuePrimitiveInteger, class_name: 'Extension'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueRatio, class_name: 'Ratio'
    embeds_one :valueSampledData, class_name: 'SampledData'
    field :valuePrimitiveTime, type:  # primitive
    embeds_one :_valuePrimitiveTime, class_name: 'Extension'
    field :valuePrimitiveDateTime, type:  # primitive
    embeds_one :_valuePrimitiveDateTime, class_name: 'Extension'
    embeds_one :valuePeriod, class_name: 'Period'
    embeds_one :dataAbsentReason, class_name: 'CodeableConcept'
    embeds_many :interpretation, class_name: 'CodeableConcept'
    embeds_many :referenceRange, class_name: 'ObservationReferenceRange'
  end
end
