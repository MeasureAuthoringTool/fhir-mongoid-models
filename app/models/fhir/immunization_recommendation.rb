module FHIR
  # fhir/immunization_recommendation.rb
  class ImmunizationRecommendation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :patient, class_name: 'FHIR::Reference'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :authority, class_name: 'FHIR::Reference'
    embeds_many :recommendation, class_name: 'FHIR::ImmunizationRecommendationRecommendation'

    def self.transform_json(json_hash, target = ImmunizationRecommendation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?      
      result['recommendation'] = json_hash['recommendation'].map { |var| ImmunizationRecommendationRecommendation.transform_json(var) } unless json_hash['recommendation'].nil?

      result
    end
  end
end
