module FHIR
  class ClaimResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimResponse'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ClaimResponseStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    embeds_one :use, class_name: 'Use'
    embeds_one :patient, class_name: 'Reference'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :requestor, class_name: 'Reference'
    embeds_one :request, class_name: 'Reference'
    embeds_one :outcome, class_name: 'RemittanceOutcome'
    field :disposition, type:  # primitive
    embeds_one :_disposition, class_name: 'Extension'
    field :preAuthRef, type:  # primitive
    embeds_one :_preAuthRef, class_name: 'Extension'
    embeds_one :preAuthPeriod, class_name: 'Period'
    embeds_one :payeeType, class_name: 'CodeableConcept'
    embeds_many :item, class_name: 'ClaimResponseItem'
    embeds_many :addItem, class_name: 'ClaimResponseAddItem'
    embeds_many :adjudication, class_name: 'ClaimResponseItemAdjudication'
    embeds_many :total, class_name: 'ClaimResponseTotal'
    embeds_one :payment, class_name: 'ClaimResponsePayment'
    embeds_one :fundsReserve, class_name: 'CodeableConcept'
    embeds_one :formCode, class_name: 'CodeableConcept'
    embeds_one :form, class_name: 'Attachment'
    embeds_many :processNote, class_name: 'ClaimResponseProcessNote'
    embeds_many :communicationRequest, class_name: 'Reference'
    embeds_many :insurance, class_name: 'ClaimResponseInsurance'
    embeds_many :error, class_name: 'ClaimResponseError'
  end
end
