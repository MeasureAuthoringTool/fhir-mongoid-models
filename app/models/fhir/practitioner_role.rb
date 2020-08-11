module FHIR
  # fhir/practitioner_role.rb
  class PractitionerRole < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :practitioner, class_name: 'FHIR::Reference'    
    embeds_one :organization, class_name: 'FHIR::Reference'    
    embeds_many :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_many :location, class_name: 'FHIR::Reference'    
    embeds_many :healthcareService, class_name: 'FHIR::Reference'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :availableTime, class_name: 'FHIR::PractitionerRoleAvailableTime'    
    embeds_many :notAvailable, class_name: 'FHIR::PractitionerRoleNotAvailable'    
    embeds_one :availabilityExceptions, class_name: 'FHIR::PrimitiveString'    
    embeds_many :endpoint, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.active.nil? 
        result['active'] = self.active.value
        serialized = Extension.serializePrimitiveExtension(self.active)            
        result['_active'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.practitioner.nil? 
        result['practitioner'] = self.practitioner.as_json(*args)
      end
      unless self.organization.nil? 
        result['organization'] = self.organization.as_json(*args)
      end
      unless self.code.nil?  || !self.code.any? 
        result['code'] = self.code.map{ |x| x.as_json(*args) }
      end
      unless self.specialty.nil?  || !self.specialty.any? 
        result['specialty'] = self.specialty.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil?  || !self.location.any? 
        result['location'] = self.location.map{ |x| x.as_json(*args) }
      end
      unless self.healthcareService.nil?  || !self.healthcareService.any? 
        result['healthcareService'] = self.healthcareService.map{ |x| x.as_json(*args) }
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
      end
      unless self.availableTime.nil?  || !self.availableTime.any? 
        result['availableTime'] = self.availableTime.map{ |x| x.as_json(*args) }
      end
      unless self.notAvailable.nil?  || !self.notAvailable.any? 
        result['notAvailable'] = self.notAvailable.map{ |x| x.as_json(*args) }
      end
      unless self.availabilityExceptions.nil? 
        result['availabilityExceptions'] = self.availabilityExceptions.value
        serialized = Extension.serializePrimitiveExtension(self.availabilityExceptions)            
        result['_availabilityExceptions'] = serialized unless serialized.nil?
      end
      unless self.endpoint.nil?  || !self.endpoint.any? 
        result['endpoint'] = self.endpoint.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PractitionerRole.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['practitioner'] = Reference.transform_json(json_hash['practitioner']) unless json_hash['practitioner'].nil?
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?
      result['code'] = json_hash['code'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['code'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialty'].nil?
      result['location'] = json_hash['location'].map { |var| Reference.transform_json(var) } unless json_hash['location'].nil?
      result['healthcareService'] = json_hash['healthcareService'].map { |var| Reference.transform_json(var) } unless json_hash['healthcareService'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['availableTime'] = json_hash['availableTime'].map { |var| PractitionerRoleAvailableTime.transform_json(var) } unless json_hash['availableTime'].nil?
      result['notAvailable'] = json_hash['notAvailable'].map { |var| PractitionerRoleNotAvailable.transform_json(var) } unless json_hash['notAvailable'].nil?
      result['availabilityExceptions'] = PrimitiveString.transform_json(json_hash['availabilityExceptions'], json_hash['_availabilityExceptions']) unless json_hash['availabilityExceptions'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| Reference.transform_json(var) } unless json_hash['endpoint'].nil?

      result
    end
  end
end
