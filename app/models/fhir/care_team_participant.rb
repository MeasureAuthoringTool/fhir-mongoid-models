module FHIR
  # fhir/care_team_participant.rb
  class CareTeamParticipant < BackboneElement
    include Mongoid::Document
    embeds_many :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :member, class_name: 'FHIR::Reference'    
    embeds_one :onBehalfOf, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.role.nil?  || !self.role.any? 
        result['role'] = self.role.map{ |x| x.as_json(*args) }
      end
      unless self.member.nil? 
        result['member'] = self.member.as_json(*args)
      end
      unless self.onBehalfOf.nil? 
        result['onBehalfOf'] = self.onBehalfOf.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
