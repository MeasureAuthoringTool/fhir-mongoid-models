module FHIR
  # fhir/immunization_protocol_applied.rb
  class ImmunizationProtocolApplied < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationProtocolApplied'
    embeds_one :series, class_name: 'PrimitiveString'
    embeds_one :authority, class_name: 'Reference'
    embeds_many :targetDisease, class_name: 'CodeableConcept'
    embeds_one :doseNumberpositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :doseNumberstring, class_name: 'PrimitiveString'
    embeds_one :seriesDosespositiveInt, class_name: 'PrimitivePositiveInt'
    embeds_one :seriesDosesstring, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ImmunizationProtocolApplied.new
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?      
      result['authority'] = Reference.transform_json(json_hash['authority']) unless json_hash['authority'].nil?      
      result['targetDisease'] = json_hash['targetDisease'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['targetDisease'].nil?
      result['doseNumberpositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberpositiveInt'], json_hash['_doseNumberpositiveInt']) unless json_hash['doseNumberpositiveInt'].nil?      
      result['doseNumberstring'] = PrimitiveString.transform_json(json_hash['doseNumberstring'], json_hash['_doseNumberstring']) unless json_hash['doseNumberstring'].nil?      
      result['seriesDosespositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosespositiveInt'], json_hash['_seriesDosespositiveInt']) unless json_hash['seriesDosespositiveInt'].nil?      
      result['seriesDosesstring'] = PrimitiveString.transform_json(json_hash['seriesDosesstring'], json_hash['_seriesDosesstring']) unless json_hash['seriesDosesstring'].nil?      

      result
    end
  end
end
