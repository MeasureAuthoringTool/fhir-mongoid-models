module FHIR
  class SpecimenCollection < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SpecimenCollection'
    embeds_one :collector, class_name: 'Reference'
    field :collectedPrimitiveDateTime, type:  # primitive
    embeds_one :_collectedPrimitiveDateTime, class_name: 'Extension'
    embeds_one :collectedPeriod, class_name: 'Period'
    embeds_one :duration, class_name: 'Duration'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_one :fastingStatusCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :fastingStatusDuration, class_name: 'Duration'
  end
end
