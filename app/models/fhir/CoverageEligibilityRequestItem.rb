module FHIR
  class CoverageEligibilityRequestItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityRequestItem'
    field :supportingInfoSequence, type: Array # primitive
    embeds_many :_supportingInfoSequence, class_name: 'Extension'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    embeds_one :facility, class_name: 'Reference'
    embeds_many :diagnosis, class_name: 'CoverageEligibilityRequestItemDiagnosis'
    embeds_many :detail, class_name: 'Reference'
  end
end
