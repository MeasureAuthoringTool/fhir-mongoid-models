module FHIR
  class MedicationAdministrationDosage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationAdministrationDosage'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    embeds_one :site, class_name: 'CodeableConcept'
    embeds_one :route, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :dose, class_name: 'SimpleQuantity'
    embeds_one :rateRatio, class_name: 'Ratio'
    embeds_one :rateSimpleQuantity, class_name: 'SimpleQuantity'
  end
end
