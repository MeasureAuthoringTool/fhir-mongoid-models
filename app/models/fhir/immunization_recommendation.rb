module FHIR
  # fhir/immunization_recommendation.rb
  class ImmunizationRecommendation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationRecommendation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :authority, class_name: 'Reference'
    embeds_many :recommendation, class_name: 'ImmunizationRecommendationRecommendation'

    def self.transform_json(json_hash)
      result = ImmunizationRecommendation.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?      
      result['recommendation'] = json_hash['recommendation'].map { |var| ImmunizationRecommendationRecommendation.transform_json(var) } unless json_hash['recommendation'].nil?

      result
    end
  end
end
