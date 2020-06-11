module FHIR
  class ChargeItem < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ChargeItem'
    embeds_many :identifier, class_name: 'Identifier'
    field :definitionUri, type: Array # primitive
    embeds_many :_definitionUri, class_name: 'Extension'
    field :definitionCanonical, type: Array # primitive
    embeds_many :_definitionCanonical, class_name: 'Extension'
    embeds_one :status, class_name: 'ChargeItemStatus'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_many :performer, class_name: 'ChargeItemPerformer'
    embeds_one :performingOrganization, class_name: 'Reference'
    embeds_one :requestingOrganization, class_name: 'Reference'
    embeds_one :costCenter, class_name: 'Reference'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :bodysite, class_name: 'CodeableConcept'
    field :factorOverride, type:  # primitive
    embeds_one :_factorOverride, class_name: 'Extension'
    embeds_one :priceOverride, class_name: 'Money'
    field :overrideReason, type:  # primitive
    embeds_one :_overrideReason, class_name: 'Extension'
    embeds_one :enterer, class_name: 'Reference'
    field :enteredDate, type:  # primitive
    embeds_one :_enteredDate, class_name: 'Extension'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_many :service, class_name: 'Reference'
    embeds_one :productReference, class_name: 'Reference'
    embeds_one :productCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :account, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :supportingInformation, class_name: 'Reference'
  end
end
