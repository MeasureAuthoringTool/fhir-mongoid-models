module FHIR
  class InsurancePlanCoverageBenefitLimit < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanCoverageBenefitLimit'
    embeds_one :value, class_name: 'Quantity'
    embeds_one :code, class_name: 'CodeableConcept'
  end
end
