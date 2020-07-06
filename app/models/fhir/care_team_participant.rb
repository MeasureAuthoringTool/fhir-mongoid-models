module FHIR
  # fhir/care_team_participant.rb
  class CareTeamParticipant < BackboneElement
    include Mongoid::Document
    embeds_many :role, class_name: 'CodeableConcept'
    embeds_one :member, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash, target = CareTeamParticipant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['role'] = json_hash['role'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['role'].nil?
      result['member'] = Reference.transform_json(json_hash['member']) unless json_hash['member'].nil?      
      result['onBehalfOf'] = Reference.transform_json(json_hash['onBehalfOf']) unless json_hash['onBehalfOf'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
