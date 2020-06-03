module FHIR
  class Coverage < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Coverage'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'CoverageStatus'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :policyHolder, class_name: 'Reference'
    embeds_one :subscriber, class_name: 'Reference'
    field :subscriberId, type:  # primitive
    embeds_one :_subscriberId, class_name: 'Extension'
    embeds_one :beneficiary, class_name: 'Reference'
    field :dependent, type:  # primitive
    embeds_one :_dependent, class_name: 'Extension'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_many :payor, class_name: 'Reference'
    embeds_many :class, class_name: 'CoverageClass'
    field :order, type:  # primitive
    embeds_one :_order, class_name: 'Extension'
    field :network, type:  # primitive
    embeds_one :_network, class_name: 'Extension'
    embeds_many :costToBeneficiary, class_name: 'CoverageCostToBeneficiary'
    field :subrogation, type:  # primitive
    embeds_one :_subrogation, class_name: 'Extension'
    embeds_many :contract, class_name: 'Reference'
  end
end
