module FHIR
  # fhir/practitioner_role_available_time.rb
  class PractitionerRoleAvailableTime < BackboneElement
    include Mongoid::Document
    embeds_many :daysOfWeek, class_name: 'FHIR::DaysOfWeek'
    embeds_one :allDay, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :availableStartTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :availableEndTime, class_name: 'FHIR::PrimitiveTime'

    def self.transform_json(json_hash, target = PractitionerRoleAvailableTime.new)
      result = self.superclass.transform_json(json_hash, target)
      result['daysOfWeek'] = json_hash['daysOfWeek'].map { |var| DaysOfWeek.transform_json(var) } unless json_hash['daysOfWeek'].nil?
      result['allDay'] = PrimitiveBoolean.transform_json(json_hash['allDay'], json_hash['_allDay']) unless json_hash['allDay'].nil?      
      result['availableStartTime'] = PrimitiveTime.transform_json(json_hash['availableStartTime'], json_hash['_availableStartTime']) unless json_hash['availableStartTime'].nil?      
      result['availableEndTime'] = PrimitiveTime.transform_json(json_hash['availableEndTime'], json_hash['_availableEndTime']) unless json_hash['availableEndTime'].nil?      

      result
    end
  end
end
