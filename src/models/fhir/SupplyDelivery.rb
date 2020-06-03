module FHIR
  class SupplyDelivery < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyDelivery'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'SupplyDeliveryStatus'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :suppliedItem, class_name: 'SupplyDeliverySuppliedItem'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_one :supplier, class_name: 'Reference'
    embeds_one :destination, class_name: 'Reference'
    embeds_many :receiver, class_name: 'Reference'
  end
end
