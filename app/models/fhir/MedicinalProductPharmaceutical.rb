module FHIR
  class MedicinalProductPharmaceutical < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceutical'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :administrableDoseForm, class_name: 'CodeableConcept'
    embeds_one :unitOfPresentation, class_name: 'CodeableConcept'
    embeds_many :ingredient, class_name: 'Reference'
    embeds_many :device, class_name: 'Reference'
    embeds_many :characteristics, class_name: 'MedicinalProductPharmaceuticalCharacteristics'
    embeds_many :routeOfAdministration, class_name: 'MedicinalProductPharmaceuticalRouteOfAdministration'
  end
end
