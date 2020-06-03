module FHIR
  class SupplyRequest < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyRequest'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'SupplyRequestStatus'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'RequestPriority'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :parameter, class_name: 'SupplyRequestParameter'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    field :authoredOn, type:  # primitive
    embeds_one :_authoredOn, class_name: 'Extension'
    embeds_one :requester, class_name: 'Reference'
    embeds_many :supplier, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_one :deliverFrom, class_name: 'Reference'
    embeds_one :deliverTo, class_name: 'Reference'
  end
end
