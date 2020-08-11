module FHIR
  # fhir/slot.rb
  class Slot < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :serviceCategory, class_name: 'FHIR::CodeableConcept'    
    embeds_many :serviceType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_one :appointmentType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :schedule, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::SlotStatus'    
    embeds_one :start, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :overbooked, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.serviceCategory.nil?  || !self.serviceCategory.any? 
        result['serviceCategory'] = self.serviceCategory.map{ |x| x.as_json(*args) }
      end
      unless self.serviceType.nil?  || !self.serviceType.any? 
        result['serviceType'] = self.serviceType.map{ |x| x.as_json(*args) }
      end
      unless self.specialty.nil?  || !self.specialty.any? 
        result['specialty'] = self.specialty.map{ |x| x.as_json(*args) }
      end
      unless self.appointmentType.nil? 
        result['appointmentType'] = self.appointmentType.as_json(*args)
      end
      unless self.schedule.nil? 
        result['schedule'] = self.schedule.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.start.nil? 
        result['start'] = self.start.value
        serialized = Extension.serializePrimitiveExtension(self.start)            
        result['_start'] = serialized unless serialized.nil?
      end
      unless self.end.nil? 
        result['end'] = self.end.value
        serialized = Extension.serializePrimitiveExtension(self.end)            
        result['_end'] = serialized unless serialized.nil?
      end
      unless self.overbooked.nil? 
        result['overbooked'] = self.overbooked.value
        serialized = Extension.serializePrimitiveExtension(self.overbooked)            
        result['_overbooked'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Slot.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['serviceCategory'] = json_hash['serviceCategory'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceCategory'].nil?
      result['serviceType'] = json_hash['serviceType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['serviceType'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['appointmentType'] = CodeableConcept.transform_json(json_hash['appointmentType']) unless json_hash['appointmentType'].nil?
      result['schedule'] = Reference.transform_json(json_hash['schedule']) unless json_hash['schedule'].nil?
      result['status'] = SlotStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['start'] = PrimitiveInstant.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?
      result['end'] = PrimitiveInstant.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?
      result['overbooked'] = PrimitiveBoolean.transform_json(json_hash['overbooked'], json_hash['_overbooked']) unless json_hash['overbooked'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
