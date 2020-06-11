module FHIR
  class CoverageEligibilityResponseInsuranceItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageEligibilityResponseInsuranceItem'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_one :provider, class_name: 'Reference'
    field :excluded, type:  # primitive
    embeds_one :_excluded, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :network, class_name: 'CodeableConcept'
    embeds_one :unit, class_name: 'CodeableConcept'
    embeds_one :term, class_name: 'CodeableConcept'
    embeds_many :benefit, class_name: 'CoverageEligibilityResponseInsuranceItemBenefit'
    field :authorizationRequired, type:  # primitive
    embeds_one :_authorizationRequired, class_name: 'Extension'
    embeds_many :authorizationSupporting, class_name: 'CodeableConcept'
    field :authorizationUrl, type:  # primitive
    embeds_one :_authorizationUrl, class_name: 'Extension'
  end
end
