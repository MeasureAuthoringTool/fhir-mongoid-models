module FHIR
  class MedicinalProductPharmaceuticalRouteOfAdministration < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalRouteOfAdministration'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :firstDose, class_name: 'Quantity'
    embeds_one :maxSingleDose, class_name: 'Quantity'
    embeds_one :maxDosePerDay, class_name: 'Quantity'
    embeds_one :maxDosePerTreatmentPeriod, class_name: 'Ratio'
    embeds_one :maxTreatmentPeriod, class_name: 'Duration'
    embeds_many :targetSpecies, class_name: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies'
  end
end
