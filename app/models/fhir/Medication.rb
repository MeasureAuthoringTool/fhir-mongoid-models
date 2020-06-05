module FHIR
  class Medication < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Medication'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'MedicationStatus'
    embeds_one :manufacturer, class_name: 'Reference'
    embeds_one :form, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Ratio'
    embeds_many :ingredient, class_name: 'MedicationIngredient'
    embeds_one :batch, class_name: 'MedicationBatch'
  end
end
