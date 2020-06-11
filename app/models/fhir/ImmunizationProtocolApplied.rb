module FHIR
  class ImmunizationProtocolApplied < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationProtocolApplied'
    field :series, type:  # primitive
    embeds_one :_series, class_name: 'Extension'
    embeds_one :authority, class_name: 'Reference'
    embeds_many :targetDisease, class_name: 'CodeableConcept'
    field :doseNumberPrimitivePositiveInt, type:  # primitive
    embeds_one :_doseNumberPrimitivePositiveInt, class_name: 'Extension'
    field :doseNumberPrimitiveString, type:  # primitive
    embeds_one :_doseNumberPrimitiveString, class_name: 'Extension'
    field :seriesDosesPrimitivePositiveInt, type:  # primitive
    embeds_one :_seriesDosesPrimitivePositiveInt, class_name: 'Extension'
    field :seriesDosesPrimitiveString, type:  # primitive
    embeds_one :_seriesDosesPrimitiveString, class_name: 'Extension'
  end
end
