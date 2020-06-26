module FHIR
  # fhir/appointment_response.rb
  class AppointmentResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'AppointmentResponse'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :appointment, class_name: 'Reference'
    embeds_one :start, class_name: 'PrimitiveInstant'
    embeds_one :end, class_name: 'PrimitiveInstant'
    embeds_many :participantType, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
    embeds_one :participantStatus, class_name: 'ParticipantStatus'
    embeds_one :comment, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = AppointmentResponse.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['appointment'] = Reference.transform_json(json_hash['appointment']) unless json_hash['appointment'].nil?      
      result['start'] = PrimitiveInstant.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?      
      result['end'] = PrimitiveInstant.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      
      result['participantType'] = json_hash['participantType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['participantType'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      
      result['participantStatus'] = ParticipantStatus.transform_json(json_hash['participantStatus']) unless json_hash['participantStatus'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
