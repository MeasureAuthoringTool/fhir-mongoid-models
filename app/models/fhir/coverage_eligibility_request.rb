module FHIR
  # fhir/coverage_eligibility_request.rb
  class CoverageEligibilityRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::EligibilityRequestStatus'    
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'    
    embeds_many :purpose, class_name: 'FHIR::EligibilityRequestPurpose'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :servicedDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :servicedPeriod, class_name: 'FHIR::Period'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :enterer, class_name: 'FHIR::Reference'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :insurer, class_name: 'FHIR::Reference'    
    embeds_one :facility, class_name: 'FHIR::Reference'    
    embeds_many :supportingInfo, class_name: 'FHIR::CoverageEligibilityRequestSupportingInfo'    
    embeds_many :insurance, class_name: 'FHIR::CoverageEligibilityRequestInsurance'    
    embeds_many :item, class_name: 'FHIR::CoverageEligibilityRequestItem'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.as_json(*args)
      end
      unless self.purpose.nil?  || !self.purpose.any? 
        result['purpose'] = self.purpose.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.purpose)                              
        result['_purpose'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.servicedDate.nil?
        result['servicedDate'] = self.servicedDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.servicedDate) 
        result['_servicedDate'] = serialized unless serialized.nil?
      end          
      unless self.servicedPeriod.nil?
        result['servicedPeriod'] = self.servicedPeriod.as_json(*args)                        
      end          
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.enterer.nil? 
        result['enterer'] = self.enterer.as_json(*args)
      end
      unless self.provider.nil? 
        result['provider'] = self.provider.as_json(*args)
      end
      unless self.insurer.nil? 
        result['insurer'] = self.insurer.as_json(*args)
      end
      unless self.facility.nil? 
        result['facility'] = self.facility.as_json(*args)
      end
      unless self.supportingInfo.nil?  || !self.supportingInfo.any? 
        result['supportingInfo'] = self.supportingInfo.map{ |x| x.as_json(*args) }
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.item.nil?  || !self.item.any? 
        result['item'] = self.item.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageEligibilityRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = EligibilityRequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?
      result['purpose'] = json_hash['purpose'].each_with_index.map do |var, i|
        extension_hash = json_hash['_purpose'] && json_hash['_purpose'][i]
        EligibilityRequestPurpose.transform_json(var, extension_hash)
      end unless json_hash['purpose'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CoverageEligibilityRequestSupportingInfo.transform_json(var) 
        end
      } unless json_hash['supportingInfo'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CoverageEligibilityRequestInsurance.transform_json(var) 
        end
      } unless json_hash['insurance'].nil?
      result['item'] = json_hash['item'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CoverageEligibilityRequestItem.transform_json(var) 
        end
      } unless json_hash['item'].nil?

      result
    end
  end
end
