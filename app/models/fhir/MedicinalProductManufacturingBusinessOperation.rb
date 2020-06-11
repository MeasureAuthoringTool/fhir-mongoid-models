module FHIR
  class MedicinalProductManufacturingBusinessOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductManufacturingBusinessOperation'
    embeds_one :operationType, class_name: 'CodeableConcept'
    embeds_one :authorisationReferenceNumber, class_name: 'Identifier'
    field :effectiveDate, type:  # primitive
    embeds_one :_effectiveDate, class_name: 'Extension'
    embeds_one :confidentialityIndicator, class_name: 'CodeableConcept'
    embeds_many :manufacturer, class_name: 'Reference'
    embeds_one :regulator, class_name: 'Reference'
  end
end
