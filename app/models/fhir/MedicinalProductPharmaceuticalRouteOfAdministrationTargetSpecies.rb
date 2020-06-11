module FHIR
  class MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :withdrawalPeriod, class_name: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod'
  end
end
