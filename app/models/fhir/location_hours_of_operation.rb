module FHIR
  # fhir/location_hours_of_operation.rb
  class LocationHoursOfOperation < BackboneElement
    include Mongoid::Document
    embeds_many :daysOfWeek, class_name: 'FHIR::DaysOfWeek'    
    embeds_one :allDay, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :openingTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :closingTime, class_name: 'FHIR::PrimitiveTime'    
    
    def as_json(*args)
      result = super      
      unless self.daysOfWeek.nil?  || !self.daysOfWeek.any? 
        result['daysOfWeek'] = self.daysOfWeek.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.daysOfWeek)                              
        result['_daysOfWeek'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.allDay.nil? 
        result['allDay'] = self.allDay.value
        serialized = Extension.serializePrimitiveExtension(self.allDay)            
        result['_allDay'] = serialized unless serialized.nil?
      end
      unless self.openingTime.nil? 
        result['openingTime'] = self.openingTime.value
        serialized = Extension.serializePrimitiveExtension(self.openingTime)            
        result['_openingTime'] = serialized unless serialized.nil?
      end
      unless self.closingTime.nil? 
        result['closingTime'] = self.closingTime.value
        serialized = Extension.serializePrimitiveExtension(self.closingTime)            
        result['_closingTime'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = LocationHoursOfOperation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['daysOfWeek'] = json_hash['daysOfWeek'].each_with_index.map do |var, i|
        extension_hash = json_hash['_daysOfWeek'] && json_hash['_daysOfWeek'][i]
        DaysOfWeek.transform_json(var, extension_hash)
      end unless json_hash['daysOfWeek'].nil?
      result['allDay'] = PrimitiveBoolean.transform_json(json_hash['allDay'], json_hash['_allDay']) unless json_hash['allDay'].nil?
      result['openingTime'] = PrimitiveTime.transform_json(json_hash['openingTime'], json_hash['_openingTime']) unless json_hash['openingTime'].nil?
      result['closingTime'] = PrimitiveTime.transform_json(json_hash['closingTime'], json_hash['_closingTime']) unless json_hash['closingTime'].nil?

      result
    end
  end
end
