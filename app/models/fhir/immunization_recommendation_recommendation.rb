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
    embeds_one :doseNumberpositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :doseNumberstring, class_name: 'PrimitiveString'
    embeds_one :seriesDosespositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :seriesDosesstring, class_name: 'PrimitiveString'
    embeds_many :supportingImmunization, class_name: 'Reference'
    embeds_many :supportingPatientInformation, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ImmunizationRecommendationRecommendation.new
      result['vaccineCode'] = json_hash['vaccineCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['vaccineCode'].nil?
      result['targetDisease'] = CodeableConcept.transform_json(json_hash['targetDisease']) unless json_hash['targetDisease'].nil?      
      result['contraindicatedVaccineCode'] = json_hash['contraindicatedVaccineCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['contraindicatedVaccineCode'].nil?
      result['forecastStatus'] = CodeableConcept.transform_json(json_hash['forecastStatus']) unless json_hash['forecastStatus'].nil?      
      result['forecastReason'] = json_hash['forecastReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['forecastReason'].nil?
      result['dateCriterion'] = json_hash['dateCriterion'].map { |var| ImmunizationRecommendationRecommendationDateCriterion.transform_json(var) } unless json_hash['dateCriterion'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?      
      result['doseNumberpositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberpositiveInt'], json_hash['_doseNumberpositiveInt']) unless json_hash['doseNumberpositiveInt'].nil?      
      result['doseNumberstring'] = PrimitiveString.transform_json(json_hash['doseNumberstring'], json_hash['_doseNumberstring']) unless json_hash['doseNumberstring'].nil?      
      result['seriesDosespositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosespositiveInt'], json_hash['_seriesDosespositiveInt']) unless json_hash['seriesDosespositiveInt'].nil?      
      result['seriesDosesstring'] = PrimitiveString.transform_json(json_hash['seriesDosesstring'], json_hash['_seriesDosesstring']) unless json_hash['seriesDosesstring'].nil?      
      result['supportingImmunization'] = json_hash['supportingImmunization'].map { |var| Reference.transform_json(var) } unless json_hash['supportingImmunization'].nil?
      result['supportingPatientInformation'] = json_hash['supportingPatientInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingPatientInformation'].nil?

      result
    end
  end
end
