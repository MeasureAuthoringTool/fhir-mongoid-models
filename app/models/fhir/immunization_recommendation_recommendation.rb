module FHIR
  # fhir/immunization_recommendation_recommendation.rb
  class ImmunizationRecommendationRecommendation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationRecommendationRecommendation'
    embeds_many :vaccineCode, class_name: 'CodeableConcept'
    embeds_one :targetDisease, class_name: 'CodeableConcept'
    embeds_many :contraindicatedVaccineCode, class_name: 'CodeableConcept'
    embeds_one :forecastStatus, class_name: 'CodeableConcept'
    embeds_many :forecastReason, class_name: 'CodeableConcept'
    embeds_many :dateCriterion, class_name: 'ImmunizationRecommendationRecommendationDateCriterion'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :series, class_name: 'PrimitiveString'
    embeds_one :doseNumberPositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :doseNumberString, class_name: 'PrimitiveString'
    embeds_one :seriesDosesPositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :seriesDosesString, class_name: 'PrimitiveString'
    embeds_many :supportingImmunization, class_name: 'Reference'
    embeds_many :supportingPatientInformation, class_name: 'Reference'

    def self.transform_json(json_hash, target=ImmunizationRecommendationRecommendation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['vaccineCode'] = json_hash['vaccineCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['vaccineCode'].nil?
      result['targetDisease'] = CodeableConcept.transform_json(json_hash['targetDisease']) unless json_hash['targetDisease'].nil?      
      result['contraindicatedVaccineCode'] = json_hash['contraindicatedVaccineCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['contraindicatedVaccineCode'].nil?
      result['forecastStatus'] = CodeableConcept.transform_json(json_hash['forecastStatus']) unless json_hash['forecastStatus'].nil?      
      result['forecastReason'] = json_hash['forecastReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['forecastReason'].nil?
      result['dateCriterion'] = json_hash['dateCriterion'].map { |var| ImmunizationRecommendationRecommendationDateCriterion.transform_json(var) } unless json_hash['dateCriterion'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?      
      result['doseNumberPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberPositiveInt'], json_hash['_doseNumberPositiveInt']) unless json_hash['doseNumberPositiveInt'].nil?      
      result['doseNumberString'] = PrimitiveString.transform_json(json_hash['doseNumberString'], json_hash['_doseNumberString']) unless json_hash['doseNumberString'].nil?      
      result['seriesDosesPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosesPositiveInt'], json_hash['_seriesDosesPositiveInt']) unless json_hash['seriesDosesPositiveInt'].nil?      
      result['seriesDosesString'] = PrimitiveString.transform_json(json_hash['seriesDosesString'], json_hash['_seriesDosesString']) unless json_hash['seriesDosesString'].nil?      
      result['supportingImmunization'] = json_hash['supportingImmunization'].map { |var| Reference.transform_json(var) } unless json_hash['supportingImmunization'].nil?
      result['supportingPatientInformation'] = json_hash['supportingPatientInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingPatientInformation'].nil?

      result
    end
  end
end
