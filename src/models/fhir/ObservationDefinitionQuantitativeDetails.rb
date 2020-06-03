module FHIR
  class ObservationDefinitionQuantitativeDetails < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ObservationDefinitionQuantitativeDetails'
    embeds_one :customaryUnit, class_name: 'CodeableConcept'
    embeds_one :unit, class_name: 'CodeableConcept'
    field :conversionFactor, type:  # primitive
    embeds_one :_conversionFactor, class_name: 'Extension'
    field :decimalPrecision, type:  # primitive
    embeds_one :_decimalPrecision, class_name: 'Extension'
  end
end
