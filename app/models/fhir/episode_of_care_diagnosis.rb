module FHIR
  # fhir/episode_of_care_diagnosis.rb
  class EpisodeOfCareDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EpisodeOfCareDiagnosis'
    embeds_one :condition, class_name: 'Reference'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :rank, class_name: 'PrimitivePositiveInt'

    def self.transform_json(json_hash)
      result = EpisodeOfCareDiagnosis.new
      result['condition'] = Reference.transform_json(json_hash['condition']) unless json_hash['condition'].nil?      
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      
      result['rank'] = PrimitivePositiveInt.transform_json(json_hash['rank'], json_hash['_rank']) unless json_hash['rank'].nil?      

      result
    end
  end
end
