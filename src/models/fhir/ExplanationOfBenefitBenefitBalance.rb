module FHIR
  class ExplanationOfBenefitBenefitBalance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitBenefitBalance'
    embeds_one :category, class_name: 'CodeableConcept'
    field :excluded, type:  # primitive
    embeds_one :_excluded, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :network, class_name: 'CodeableConcept'
    embeds_one :unit, class_name: 'CodeableConcept'
    embeds_one :term, class_name: 'CodeableConcept'
    embeds_many :financial, class_name: 'ExplanationOfBenefitBenefitBalanceFinancial'
  end
end
