module FHIR
  class ImmunizationRecommendation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationRecommendation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :patient, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    embeds_one :authority, class_name: 'Reference'
    embeds_many :recommendation, class_name: 'ImmunizationRecommendationRecommendation'
  end
end
