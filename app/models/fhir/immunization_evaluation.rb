module FHIR
  # fhir/immunization_evaluation.rb
  class ImmunizationEvaluation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationEvaluation'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ImmunizationEvaluationStatus'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :date, class_name: 'PrimitiveDateTime'
    embeds_one :authority, class_name: 'Reference'
    embeds_one :targetDisease, class_name: 'CodeableConcept'
    embeds_one :immunizationEvent, class_name: 'Reference'
    embeds_one :doseStatus, class_name: 'CodeableConcept'
    embeds_many :doseStatusReason, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :series, class_name: 'PrimitiveString'
    embeds_one :doseNumberpositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :doseNumberstring, class_name: 'PrimitiveString'
    embeds_one :seriesDosespositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :seriesDosesstring, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ImmunizationEvaluation.new
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
      result['doseNumberpositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberpositiveInt'], json_hash['_doseNumberpositiveInt']) unless json_hash['doseNumberpositiveInt'].nil?      
      result['doseNumberstring'] = PrimitiveString.transform_json(json_hash['doseNumberstring'], json_hash['_doseNumberstring']) unless json_hash['doseNumberstring'].nil?      
      result['seriesDosespositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosespositiveInt'], json_hash['_seriesDosespositiveInt']) unless json_hash['seriesDosespositiveInt'].nil?      
      result['seriesDosesstring'] = PrimitiveString.transform_json(json_hash['seriesDosesstring'], json_hash['_seriesDosesstring']) unless json_hash['seriesDosesstring'].nil?      

      result
    end
  end
end
