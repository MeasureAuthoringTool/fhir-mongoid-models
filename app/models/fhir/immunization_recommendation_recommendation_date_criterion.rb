module FHIR
  # fhir/immunization_recommendation_recommendation_date_criterion.rb
  class ImmunizationRecommendationRecommendationDateCriterion < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :value, class_name: 'FHIR::PrimitiveDateTime'    

    def self.transform_json(json_hash, target = ImmunizationRecommendationRecommendationDateCriterion.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['value'] = PrimitiveDateTime.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
