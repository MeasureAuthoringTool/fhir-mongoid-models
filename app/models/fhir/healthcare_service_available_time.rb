module FHIR
  # fhir/healthcare_service_available_time.rb
  class HealthcareServiceAvailableTime < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'HealthcareServiceAvailableTime'
    embeds_many :daysOfWeek, class_name: 'DaysOfWeek'
    embeds_one :allDay, class_name: 'PrimitiveBoolean'
    embeds_one :availableStartTime, class_name: 'PrimitiveTime'
    embeds_one :availableEndTime, class_name: 'PrimitiveTime'

    def self.transform_json(json_hash)
      result = HealthcareServiceAvailableTime.new
      result['daysOfWeek'] = json_hash['daysOfWeek'].map { |var| DaysOfWeek.transform_json(var) } unless json_hash['daysOfWeek'].nil?
      result['allDay'] = PrimitiveBoolean.transform_json(json_hash['allDay'], json_hash['_allDay']) unless json_hash['allDay'].nil?      
      result['availableStartTime'] = PrimitiveTime.transform_json(json_hash['availableStartTime'], json_hash['_availableStartTime']) unless json_hash['availableStartTime'].nil?      
      result['availableEndTime'] = PrimitiveTime.transform_json(json_hash['availableEndTime'], json_hash['_availableEndTime']) unless json_hash['availableEndTime'].nil?      

      result
    end
  end
end
