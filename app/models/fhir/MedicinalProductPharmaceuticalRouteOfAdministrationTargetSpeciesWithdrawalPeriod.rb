module FHIR
  class MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod'
    embeds_one :tissue, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'Quantity'
    field :supportingInformation, type:  # primitive
    embeds_one :_supportingInformation, class_name: 'Extension'
  end
end
