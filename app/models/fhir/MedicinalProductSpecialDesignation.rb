module FHIR
  class MedicinalProductSpecialDesignation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductSpecialDesignation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :intendedUse, class_name: 'CodeableConcept'
    embeds_one :indicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :indicationReference, class_name: 'Reference'
    embeds_one :status, class_name: 'CodeableConcept'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :species, class_name: 'CodeableConcept'
  end
end
