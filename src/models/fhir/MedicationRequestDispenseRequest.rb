module FHIR
  class MedicationRequestDispenseRequest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestDispenseRequest'
    embeds_one :initialFill, class_name: 'MedicationRequestDispenseRequestInitialFill'
    embeds_one :dispenseInterval, class_name: 'Duration'
    embeds_one :validityPeriod, class_name: 'Period'
    field :numberOfRepeatsAllowed, type:  # primitive
    embeds_one :_numberOfRepeatsAllowed, class_name: 'Extension'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :expectedSupplyDuration, class_name: 'Duration'
    embeds_one :performer, class_name: 'Reference'
  end
end
