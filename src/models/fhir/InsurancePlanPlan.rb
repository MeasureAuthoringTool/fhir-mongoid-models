module FHIR
  class InsurancePlanPlan < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlan'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :coverageArea, class_name: 'Reference'
    embeds_many :network, class_name: 'Reference'
    embeds_many :generalCost, class_name: 'InsurancePlanPlanGeneralCost'
    embeds_many :specificCost, class_name: 'InsurancePlanPlanSpecificCost'
  end
end
