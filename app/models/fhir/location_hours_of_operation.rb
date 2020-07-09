module FHIR
  # fhir/location_hours_of_operation.rb
  class LocationHoursOfOperation < BackboneElement
    include Mongoid::Document
    embeds_many :daysOfWeek, class_name: 'FHIR::DaysOfWeek'
    embeds_one :allDay, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :openingTime, class_name: 'FHIR::PrimitiveTime'
    embeds_one :closingTime, class_name: 'FHIR::PrimitiveTime'

    def self.transform_json(json_hash, target = LocationHoursOfOperation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['daysOfWeek'] = json_hash['daysOfWeek'].map { |var| DaysOfWeek.transform_json(var) } unless json_hash['daysOfWeek'].nil?
      result['allDay'] = PrimitiveBoolean.transform_json(json_hash['allDay'], json_hash['_allDay']) unless json_hash['allDay'].nil?      
      result['openingTime'] = PrimitiveTime.transform_json(json_hash['openingTime'], json_hash['_openingTime']) unless json_hash['openingTime'].nil?      
      result['closingTime'] = PrimitiveTime.transform_json(json_hash['closingTime'], json_hash['_closingTime']) unless json_hash['closingTime'].nil?      

      result
    end
  end
end
