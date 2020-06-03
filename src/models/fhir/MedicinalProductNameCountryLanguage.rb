module FHIR
  class MedicinalProductNameCountryLanguage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductNameCountryLanguage'
    embeds_one :country, class_name: 'CodeableConcept'
    embeds_one :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :language, class_name: 'CodeableConcept'
  end
end
