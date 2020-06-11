module FHIR
  class ImmunizationRecommendationRecommendation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationRecommendationRecommendation'
    embeds_many :vaccineCode, class_name: 'CodeableConcept'
    embeds_one :targetDisease, class_name: 'CodeableConcept'
    embeds_many :contraindicatedVaccineCode, class_name: 'CodeableConcept'
    embeds_one :forecastStatus, class_name: 'CodeableConcept'
    embeds_many :forecastReason, class_name: 'CodeableConcept'
    embeds_many :dateCriterion, class_name: 'ImmunizationRecommendationRecommendationDateCriterion'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :series, type:  # primitive
    embeds_one :_series, class_name: 'Extension'
    field :doseNumberPrimitivePositiveInt, type:  # primitive
    embeds_one :_doseNumberPrimitivePositiveInt, class_name: 'Extension'
    field :doseNumberPrimitiveString, type:  # primitive
    embeds_one :_doseNumberPrimitiveString, class_name: 'Extension'
    field :seriesDosesPrimitivePositiveInt, type:  # primitive
    embeds_one :_seriesDosesPrimitivePositiveInt, class_name: 'Extension'
    field :seriesDosesPrimitiveString, type:  # primitive
    embeds_one :_seriesDosesPrimitiveString, class_name: 'Extension'
    embeds_many :supportingImmunization, class_name: 'Reference'
    embeds_many :supportingPatientInformation, class_name: 'Reference'
  end
end
