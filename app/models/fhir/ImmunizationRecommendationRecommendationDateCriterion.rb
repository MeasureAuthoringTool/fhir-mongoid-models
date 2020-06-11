module FHIR
  class ImmunizationRecommendationRecommendationDateCriterion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationRecommendationRecommendationDateCriterion'
    embeds_one :code, class_name: 'CodeableConcept'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
