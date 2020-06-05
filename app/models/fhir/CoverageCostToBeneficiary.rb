module FHIR
  class CoverageCostToBeneficiary < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CoverageCostToBeneficiary'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :valueSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :valueMoney, class_name: 'Money'
    embeds_many :exception, class_name: 'CoverageCostToBeneficiaryException'
  end
end
