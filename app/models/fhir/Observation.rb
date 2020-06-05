module FHIR
  class Observation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Observation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ObservationStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_many :focus, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :effectivePrimitiveDateTime, type:  # primitive
    embeds_one :_effectivePrimitiveDateTime, class_name: 'Extension'
    embeds_one :effectivePeriod, class_name: 'Period'
    embeds_one :effectiveTiming, class_name: 'Timing'
    field :effectivePrimitiveInstant, type:  # primitive
    embeds_one :_effectivePrimitiveInstant, class_name: 'Extension'
    field :issued, type:  # primitive
    embeds_one :_issued, class_name: 'Extension'
    embeds_many :performer, class_name: 'Reference'
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
    embeds_many :note, class_name: 'Annotation'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :specimen, class_name: 'Reference'
    embeds_one :device, class_name: 'Reference'
    embeds_many :referenceRange, class_name: 'ObservationReferenceRange'
    embeds_many :hasMember, class_name: 'Reference'
    embeds_many :derivedFrom, class_name: 'Reference'
    embeds_many :component, class_name: 'ObservationComponent'
  end
end
