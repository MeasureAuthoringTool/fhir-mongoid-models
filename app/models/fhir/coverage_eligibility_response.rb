module FHIR
  # fhir/coverage_eligibility_response.rb
  class CoverageEligibilityResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::EligibilityResponseStatus'    
    embeds_many :purpose, class_name: 'FHIR::EligibilityResponsePurpose'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :servicedDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :servicedPeriod, class_name: 'FHIR::Period'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requestor, class_name: 'FHIR::Reference'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'    
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'    
    embeds_one :insurer, class_name: 'FHIR::Reference'    
    embeds_many :insurance, class_name: 'FHIR::CoverageEligibilityResponseInsurance'    
    embeds_one :preAuthRef, class_name: 'FHIR::PrimitiveString'    
    embeds_one :form, class_name: 'FHIR::CodeableConcept'    
    embeds_many :error, class_name: 'FHIR::CoverageEligibilityResponseError'    
    
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
      unless self.requestor.nil? 
        result['requestor'] = self.requestor.as_json(*args)
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.value
        serialized = Extension.serializePrimitiveExtension(self.outcome)            
        result['_outcome'] = serialized unless serialized.nil?
      end
      unless self.disposition.nil? 
        result['disposition'] = self.disposition.value
        serialized = Extension.serializePrimitiveExtension(self.disposition)            
        result['_disposition'] = serialized unless serialized.nil?
      end
      unless self.insurer.nil? 
        result['insurer'] = self.insurer.as_json(*args)
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.preAuthRef.nil? 
        result['preAuthRef'] = self.preAuthRef.value
        serialized = Extension.serializePrimitiveExtension(self.preAuthRef)            
        result['_preAuthRef'] = serialized unless serialized.nil?
      end
      unless self.form.nil? 
        result['form'] = self.form.as_json(*args)
      end
      unless self.error.nil?  || !self.error.any? 
        result['error'] = self.error.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CoverageEligibilityResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EligibilityResponseStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['purpose'] = json_hash['purpose'].each_with_index.map do |var, i|
        extension_hash = json_hash['_purpose'] && json_hash['_purpose'][i]
        EligibilityResponsePurpose.transform_json(var, extension_hash)
      end unless json_hash['purpose'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['requestor'] = Reference.transform_json(json_hash['requestor']) unless json_hash['requestor'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome'], json_hash['_outcome']) unless json_hash['outcome'].nil?
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| CoverageEligibilityResponseInsurance.transform_json(var) } unless json_hash['insurance'].nil?
      result['preAuthRef'] = PrimitiveString.transform_json(json_hash['preAuthRef'], json_hash['_preAuthRef']) unless json_hash['preAuthRef'].nil?
      result['form'] = CodeableConcept.transform_json(json_hash['form']) unless json_hash['form'].nil?
      result['error'] = json_hash['error'].map { |var| CoverageEligibilityResponseError.transform_json(var) } unless json_hash['error'].nil?

      result
    end
  end
end
