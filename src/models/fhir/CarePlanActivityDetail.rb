module FHIR
  class CarePlanActivityDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivityDetail'
    embeds_one :kind, class_name: 'CarePlanActivityKind'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :goal, class_name: 'Reference'
    embeds_one :status, class_name: 'CarePlanActivityStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    field :doNotPerform, type:  # primitive
    embeds_one :_doNotPerform, class_name: 'Extension'
    embeds_one :scheduledTiming, class_name: 'Timing'
    embeds_one :scheduledPeriod, class_name: 'Period'
    field :scheduledPrimitiveString, type:  # primitive
    embeds_one :_scheduledPrimitiveString, class_name: 'Extension'
    embeds_one :location, class_name: 'Reference'
    embeds_many :performer, class_name: 'Reference'
    embeds_one :productCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :productReference, class_name: 'Reference'
    embeds_one :dailyAmount, class_name: 'SimpleQuantity'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
