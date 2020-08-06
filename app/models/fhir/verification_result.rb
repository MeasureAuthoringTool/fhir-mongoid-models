module FHIR
  # fhir/verification_result.rb
  class VerificationResult < DomainResource
    include Mongoid::Document
    embeds_many :target, class_name: 'FHIR::Reference'    
    embeds_many :targetLocation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :need, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::Status'    
    embeds_one :statusDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :validationType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :validationProcess, class_name: 'FHIR::CodeableConcept'    
    embeds_one :frequency, class_name: 'FHIR::Timing'    
    embeds_one :lastPerformed, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :nextScheduled, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :failureAction, class_name: 'FHIR::CodeableConcept'    
    embeds_many :primarySource, class_name: 'FHIR::VerificationResultPrimarySource'    
    embeds_one :attestation, class_name: 'FHIR::VerificationResultAttestation'    
    embeds_many :validator, class_name: 'FHIR::VerificationResultValidator'    
    
    def as_json(*args)
      result = super      
      unless self.target.nil?  || !self.target.any? 
        result['target'] = self.target.map{ |x| x.as_json(*args) }
      end
      unless self.targetLocation.nil?  || !self.targetLocation.any? 
        result['targetLocation'] = self.targetLocation.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.targetLocation)                              
        result['_targetLocation'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.need.nil? 
        result['need'] = self.need.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusDate.nil? 
        result['statusDate'] = self.statusDate.value
        serialized = Extension.serializePrimitiveExtension(self.statusDate)            
        result['_statusDate'] = serialized unless serialized.nil?
      end
      unless self.validationType.nil? 
        result['validationType'] = self.validationType.as_json(*args)
      end
      unless self.validationProcess.nil?  || !self.validationProcess.any? 
        result['validationProcess'] = self.validationProcess.map{ |x| x.as_json(*args) }
      end
      unless self.frequency.nil? 
        result['frequency'] = self.frequency.as_json(*args)
      end
      unless self.lastPerformed.nil? 
        result['lastPerformed'] = self.lastPerformed.value
        serialized = Extension.serializePrimitiveExtension(self.lastPerformed)            
        result['_lastPerformed'] = serialized unless serialized.nil?
      end
      unless self.nextScheduled.nil? 
        result['nextScheduled'] = self.nextScheduled.value
        serialized = Extension.serializePrimitiveExtension(self.nextScheduled)            
        result['_nextScheduled'] = serialized unless serialized.nil?
      end
      unless self.failureAction.nil? 
        result['failureAction'] = self.failureAction.as_json(*args)
      end
      unless self.primarySource.nil?  || !self.primarySource.any? 
        result['primarySource'] = self.primarySource.map{ |x| x.as_json(*args) }
      end
      unless self.attestation.nil? 
        result['attestation'] = self.attestation.as_json(*args)
      end
      unless self.validator.nil?  || !self.validator.any? 
        result['validator'] = self.validator.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VerificationResult.new)
      result = self.superclass.transform_json(json_hash, target)
      result['target'] = json_hash['target'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['target'].nil?
      result['targetLocation'] = json_hash['targetLocation'].each_with_index.map do |var, i|
        extension_hash = json_hash['_targetLocation'] && json_hash['_targetLocation'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['targetLocation'].nil?
      result['need'] = CodeableConcept.transform_json(json_hash['need']) unless json_hash['need'].nil?
      result['status'] = Status.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusDate'] = PrimitiveDateTime.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?
      result['validationType'] = CodeableConcept.transform_json(json_hash['validationType']) unless json_hash['validationType'].nil?
      result['validationProcess'] = json_hash['validationProcess'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['validationProcess'].nil?
      result['frequency'] = Timing.transform_json(json_hash['frequency']) unless json_hash['frequency'].nil?
      result['lastPerformed'] = PrimitiveDateTime.transform_json(json_hash['lastPerformed'], json_hash['_lastPerformed']) unless json_hash['lastPerformed'].nil?
      result['nextScheduled'] = PrimitiveDate.transform_json(json_hash['nextScheduled'], json_hash['_nextScheduled']) unless json_hash['nextScheduled'].nil?
      result['failureAction'] = CodeableConcept.transform_json(json_hash['failureAction']) unless json_hash['failureAction'].nil?
      result['primarySource'] = json_hash['primarySource'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          VerificationResultPrimarySource.transform_json(var) 
        end
      } unless json_hash['primarySource'].nil?
      result['attestation'] = VerificationResultAttestation.transform_json(json_hash['attestation']) unless json_hash['attestation'].nil?
      result['validator'] = json_hash['validator'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          VerificationResultValidator.transform_json(var) 
        end
      } unless json_hash['validator'].nil?

      result
    end
  end
end
