module FHIR
  # fhir/healthcare_service.rb
  class HealthcareService < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :active, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :providedBy, class_name: 'FHIR::Reference'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :specialty, class_name: 'FHIR::CodeableConcept'    
    embeds_many :location, class_name: 'FHIR::Reference'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_one :extraDetails, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :photo, class_name: 'FHIR::Attachment'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :coverageArea, class_name: 'FHIR::Reference'    
    embeds_many :serviceProvisionCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :eligibility, class_name: 'FHIR::HealthcareServiceEligibility'    
    embeds_many :program, class_name: 'FHIR::CodeableConcept'    
    embeds_many :characteristic, class_name: 'FHIR::CodeableConcept'    
    embeds_many :communication, class_name: 'FHIR::CodeableConcept'    
    embeds_many :referralMethod, class_name: 'FHIR::CodeableConcept'    
    embeds_one :appointmentRequired, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :availableTime, class_name: 'FHIR::HealthcareServiceAvailableTime'    
    embeds_many :notAvailable, class_name: 'FHIR::HealthcareServiceNotAvailable'    
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
      unless self.providedBy.nil? 
        result['providedBy'] = self.providedBy.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.specialty.nil?  || !self.specialty.any? 
        result['specialty'] = self.specialty.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil?  || !self.location.any? 
        result['location'] = self.location.map{ |x| x.as_json(*args) }
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.extraDetails.nil? 
        result['extraDetails'] = self.extraDetails.value
        serialized = Extension.serializePrimitiveExtension(self.extraDetails)            
        result['_extraDetails'] = serialized unless serialized.nil?
      end
      unless self.photo.nil? 
        result['photo'] = self.photo.as_json(*args)
      end
      unless self.telecom.nil?  || !self.telecom.any? 
        result['telecom'] = self.telecom.map{ |x| x.as_json(*args) }
      end
      unless self.coverageArea.nil?  || !self.coverageArea.any? 
        result['coverageArea'] = self.coverageArea.map{ |x| x.as_json(*args) }
      end
      unless self.serviceProvisionCode.nil?  || !self.serviceProvisionCode.any? 
        result['serviceProvisionCode'] = self.serviceProvisionCode.map{ |x| x.as_json(*args) }
      end
      unless self.eligibility.nil?  || !self.eligibility.any? 
        result['eligibility'] = self.eligibility.map{ |x| x.as_json(*args) }
      end
      unless self.program.nil?  || !self.program.any? 
        result['program'] = self.program.map{ |x| x.as_json(*args) }
      end
      unless self.characteristic.nil?  || !self.characteristic.any? 
        result['characteristic'] = self.characteristic.map{ |x| x.as_json(*args) }
      end
      unless self.communication.nil?  || !self.communication.any? 
        result['communication'] = self.communication.map{ |x| x.as_json(*args) }
      end
      unless self.referralMethod.nil?  || !self.referralMethod.any? 
        result['referralMethod'] = self.referralMethod.map{ |x| x.as_json(*args) }
      end
      unless self.appointmentRequired.nil? 
        result['appointmentRequired'] = self.appointmentRequired.value
        serialized = Extension.serializePrimitiveExtension(self.appointmentRequired)            
        result['_appointmentRequired'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = HealthcareService.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['active'] = PrimitiveBoolean.transform_json(json_hash['active'], json_hash['_active']) unless json_hash['active'].nil?
      result['providedBy'] = Reference.transform_json(json_hash['providedBy']) unless json_hash['providedBy'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['type'].nil?
      result['specialty'] = json_hash['specialty'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['specialty'].nil?
      result['location'] = json_hash['location'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['location'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['extraDetails'] = PrimitiveMarkdown.transform_json(json_hash['extraDetails'], json_hash['_extraDetails']) unless json_hash['extraDetails'].nil?
      result['photo'] = Attachment.transform_json(json_hash['photo']) unless json_hash['photo'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactPoint.transform_json(var) 
        end
      } unless json_hash['telecom'].nil?
      result['coverageArea'] = json_hash['coverageArea'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['coverageArea'].nil?
      result['serviceProvisionCode'] = json_hash['serviceProvisionCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['serviceProvisionCode'].nil?
      result['eligibility'] = json_hash['eligibility'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          HealthcareServiceEligibility.transform_json(var) 
        end
      } unless json_hash['eligibility'].nil?
      result['program'] = json_hash['program'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['program'].nil?
      result['characteristic'] = json_hash['characteristic'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['characteristic'].nil?
      result['communication'] = json_hash['communication'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['communication'].nil?
      result['referralMethod'] = json_hash['referralMethod'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['referralMethod'].nil?
      result['appointmentRequired'] = PrimitiveBoolean.transform_json(json_hash['appointmentRequired'], json_hash['_appointmentRequired']) unless json_hash['appointmentRequired'].nil?
      result['availableTime'] = json_hash['availableTime'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          HealthcareServiceAvailableTime.transform_json(var) 
        end
      } unless json_hash['availableTime'].nil?
      result['notAvailable'] = json_hash['notAvailable'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          HealthcareServiceNotAvailable.transform_json(var) 
        end
      } unless json_hash['notAvailable'].nil?
      result['availabilityExceptions'] = PrimitiveString.transform_json(json_hash['availabilityExceptions'], json_hash['_availabilityExceptions']) unless json_hash['availabilityExceptions'].nil?
      result['endpoint'] = json_hash['endpoint'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['endpoint'].nil?

      result
    end
  end
end
