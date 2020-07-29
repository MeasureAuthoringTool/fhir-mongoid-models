module FHIR
  # fhir/immunization_protocol_applied.rb
  class ImmunizationProtocolApplied < BackboneElement
    include Mongoid::Document
    embeds_one :series, class_name: 'FHIR::PrimitiveString'    
    embeds_one :authority, class_name: 'FHIR::Reference'    
    embeds_many :targetDisease, class_name: 'FHIR::CodeableConcept'    
    embeds_one :doseNumberPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :doseNumberString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :seriesDosesPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :seriesDosesString, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = ImmunizationProtocolApplied.new)
      result = self.superclass.transform_json(json_hash, target)
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?
      result['targetDisease'] = json_hash['targetDisease'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['targetDisease'].nil?
      result['doseNumberPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberPositiveInt'], json_hash['_doseNumberPositiveInt']) unless json_hash['doseNumberPositiveInt'].nil?
      result['doseNumberString'] = PrimitiveString.transform_json(json_hash['doseNumberString'], json_hash['_doseNumberString']) unless json_hash['doseNumberString'].nil?
      result['seriesDosesPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosesPositiveInt'], json_hash['_seriesDosesPositiveInt']) unless json_hash['seriesDosesPositiveInt'].nil?
      result['seriesDosesString'] = PrimitiveString.transform_json(json_hash['seriesDosesString'], json_hash['_seriesDosesString']) unless json_hash['seriesDosesString'].nil?

      result
    end
  end
end
