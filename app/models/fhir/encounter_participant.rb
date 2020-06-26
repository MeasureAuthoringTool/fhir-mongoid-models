module FHIR
  # fhir/encounter_participant.rb
  class EncounterParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterParticipant'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_one :individual, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = EncounterParticipant.new
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['individual'] = Reference.transform_json(json_hash['individual']) unless json_hash['individual'].nil?      

      result
    end
  end
end
