module FHIR
  # fhir/practitioner_role_available_time.rb
  class PractitionerRoleAvailableTime < BackboneElement
    include Mongoid::Document
    embeds_many :daysOfWeek, class_name: 'FHIR::DaysOfWeek'    
    embeds_one :allDay, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :availableStartTime, class_name: 'FHIR::PrimitiveTime'    
    embeds_one :availableEndTime, class_name: 'FHIR::PrimitiveTime'    
    
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
      unless self.availableStartTime.nil? 
        result['availableStartTime'] = self.availableStartTime.value
        serialized = Extension.serializePrimitiveExtension(self.availableStartTime)            
        result['_availableStartTime'] = serialized unless serialized.nil?
      end
      unless self.availableEndTime.nil? 
        result['availableEndTime'] = self.availableEndTime.value
        serialized = Extension.serializePrimitiveExtension(self.availableEndTime)            
        result['_availableEndTime'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PractitionerRoleAvailableTime.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['daysOfWeek'] = json_hash['daysOfWeek'].each_with_index.map do |var, i|
        extension_hash = json_hash['_daysOfWeek'] && json_hash['_daysOfWeek'][i]
        DaysOfWeek.transform_json(var, extension_hash)
      end unless json_hash['daysOfWeek'].nil?
      result['allDay'] = PrimitiveBoolean.transform_json(json_hash['allDay'], json_hash['_allDay']) unless json_hash['allDay'].nil?
      result['availableStartTime'] = PrimitiveTime.transform_json(json_hash['availableStartTime'], json_hash['_availableStartTime']) unless json_hash['availableStartTime'].nil?
      result['availableEndTime'] = PrimitiveTime.transform_json(json_hash['availableEndTime'], json_hash['_availableEndTime']) unless json_hash['availableEndTime'].nil?

      result
    end
  end
end
