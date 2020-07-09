module FHIR
  # fhir/appointment_participant.rb
  class AppointmentParticipant < BackboneElement
    include Mongoid::Document
    embeds_many :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :actor, class_name: 'FHIR::Reference'
    embeds_one :required, class_name: 'FHIR::ParticipantRequired'
    embeds_one :status, class_name: 'FHIR::ParticipationStatus'
    embeds_one :period, class_name: 'FHIR::Period'

    def self.transform_json(json_hash, target = AppointmentParticipant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['actor'] = Reference.transform_json(json_hash['actor']) unless json_hash['actor'].nil?      
      result['required'] = ParticipantRequired.transform_json(json_hash['required']) unless json_hash['required'].nil?      
      result['status'] = ParticipationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
