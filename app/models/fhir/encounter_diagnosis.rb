module FHIR
  # fhir/encounter_diagnosis.rb
  class EncounterDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterDiagnosis'
    embeds_one :condition, class_name: 'Reference'
    embeds_one :use, class_name: 'CodeableConcept'
    embeds_one :rank, class_name: 'PrimitivePositiveInt'

    def self.transform_json(json_hash)
      result = EncounterDiagnosis.new
      result['condition'] = Reference.transform_json(json_hash['condition']) unless json_hash['condition'].nil?      
      result['use'] = CodeableConcept.transform_json(json_hash['use']) unless json_hash['use'].nil?      
      result['rank'] = PrimitivePositiveInt.transform_json(json_hash['rank'], json_hash['_rank']) unless json_hash['rank'].nil?      

      result
    end
  end
end
