module FHIR
  class CoverageCostToBeneficiaryException < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageCostToBeneficiaryException'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
  end
end
