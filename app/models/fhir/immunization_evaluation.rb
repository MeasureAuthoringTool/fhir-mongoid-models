module FHIR
  # fhir/immunization_evaluation.rb
  class ImmunizationEvaluation < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::ImmunizationEvaluationStatus'
    embeds_one :patient, class_name: 'FHIR::Reference'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :authority, class_name: 'FHIR::Reference'
    embeds_one :targetDisease, class_name: 'FHIR::CodeableConcept'
    embeds_one :immunizationEvent, class_name: 'FHIR::Reference'
    embeds_one :doseStatus, class_name: 'FHIR::CodeableConcept'
    embeds_many :doseStatusReason, class_name: 'FHIR::CodeableConcept'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :series, class_name: 'FHIR::PrimitiveString'
    embeds_one :doseNumberPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :doseNumberString, class_name: 'FHIR::PrimitiveString'
    embeds_one :seriesDosesPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'
    embeds_one :seriesDosesString, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = ImmunizationEvaluation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ImmunizationEvaluationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?      
      result['targetDisease'] = CodeableConcept.transform_json(json_hash['targetDisease']) unless json_hash['targetDisease'].nil?      
      result['immunizationEvent'] = Reference.transform_json(json_hash['immunizationEvent']) unless json_hash['immunizationEvent'].nil?      
      result['doseStatus'] = CodeableConcept.transform_json(json_hash['doseStatus']) unless json_hash['doseStatus'].nil?      
      result['doseStatusReason'] = json_hash['doseStatusReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['doseStatusReason'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?      
      result['doseNumberPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberPositiveInt'], json_hash['_doseNumberPositiveInt']) unless json_hash['doseNumberPositiveInt'].nil?      
      result['doseNumberString'] = PrimitiveString.transform_json(json_hash['doseNumberString'], json_hash['_doseNumberString']) unless json_hash['doseNumberString'].nil?      
      result['seriesDosesPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosesPositiveInt'], json_hash['_seriesDosesPositiveInt']) unless json_hash['seriesDosesPositiveInt'].nil?      
      result['seriesDosesString'] = PrimitiveString.transform_json(json_hash['seriesDosesString'], json_hash['_seriesDosesString']) unless json_hash['seriesDosesString'].nil?      

      result
    end
  end
end
