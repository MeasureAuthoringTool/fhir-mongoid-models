module FHIR
  class Claim < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Claim'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ClaimStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :subType, class_name: 'CodeableConcept'
    embeds_one :use, class_name: 'Use'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :billablePeriod, class_name: 'Period'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :insurer, class_name: 'Reference'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :priority, class_name: 'CodeableConcept'
    embeds_one :fundsReserve, class_name: 'CodeableConcept'
    embeds_many :related, class_name: 'ClaimRelated'
    embeds_one :prescription, class_name: 'Reference'
    embeds_one :originalPrescription, class_name: 'Reference'
    embeds_one :payee, class_name: 'ClaimPayee'
    embeds_one :referral, class_name: 'Reference'
    embeds_one :facility, class_name: 'Reference'
    embeds_many :careTeam, class_name: 'ClaimCareTeam'
    embeds_many :supportingInfo, class_name: 'ClaimSupportingInfo'
    embeds_many :diagnosis, class_name: 'ClaimDiagnosis'
    embeds_many :procedure, class_name: 'ClaimProcedure'
    embeds_many :insurance, class_name: 'ClaimInsurance'
    embeds_one :accident, class_name: 'ClaimAccident'
    embeds_many :item, class_name: 'ClaimItem'
    embeds_one :total, class_name: 'Money'
  end
end
