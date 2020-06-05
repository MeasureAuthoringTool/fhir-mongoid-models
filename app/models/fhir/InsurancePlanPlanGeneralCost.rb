module FHIR
  class InsurancePlanPlanGeneralCost < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanPlanGeneralCost'
    embeds_one :type, class_name: 'CodeableConcept'
    field :groupSize, type:  # primitive
    embeds_one :_groupSize, class_name: 'Extension'
    embeds_one :cost, class_name: 'Money'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
