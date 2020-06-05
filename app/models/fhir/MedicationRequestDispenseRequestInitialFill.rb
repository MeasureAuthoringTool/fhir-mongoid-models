module FHIR
  class MedicationRequestDispenseRequestInitialFill < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestDispenseRequestInitialFill'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :duration, class_name: 'Duration'
  end
end
