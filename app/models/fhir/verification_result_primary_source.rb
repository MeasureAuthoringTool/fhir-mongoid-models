module FHIR
  # fhir/verification_result_primary_source.rb
  class VerificationResultPrimarySource < BackboneElement
    include Mongoid::Document
    embeds_one :who, class_name: 'FHIR::Reference'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :communicationMethod, class_name: 'FHIR::CodeableConcept'    
    embeds_one :validationStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :validationDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :canPushUpdates, class_name: 'FHIR::CodeableConcept'    
    embeds_many :pushTypeAvailable, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.who.nil? 
        result['who'] = self.who.as_json(*args)
      end
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.communicationMethod.nil?  || !self.communicationMethod.any? 
        result['communicationMethod'] = self.communicationMethod.map{ |x| x.as_json(*args) }
      end
      unless self.validationStatus.nil? 
        result['validationStatus'] = self.validationStatus.as_json(*args)
      end
      unless self.validationDate.nil? 
        result['validationDate'] = self.validationDate.value
        serialized = Extension.serializePrimitiveExtension(self.validationDate)            
        result['_validationDate'] = serialized unless serialized.nil?
      end
      unless self.canPushUpdates.nil? 
        result['canPushUpdates'] = self.canPushUpdates.as_json(*args)
      end
      unless self.pushTypeAvailable.nil?  || !self.pushTypeAvailable.any? 
        result['pushTypeAvailable'] = self.pushTypeAvailable.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = VerificationResultPrimarySource.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['who'] = Reference.transform_json(json_hash['who']) unless json_hash['who'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['communicationMethod'] = json_hash['communicationMethod'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['communicationMethod'].nil?
      result['validationStatus'] = CodeableConcept.transform_json(json_hash['validationStatus']) unless json_hash['validationStatus'].nil?
      result['validationDate'] = PrimitiveDateTime.transform_json(json_hash['validationDate'], json_hash['_validationDate']) unless json_hash['validationDate'].nil?
      result['canPushUpdates'] = CodeableConcept.transform_json(json_hash['canPushUpdates']) unless json_hash['canPushUpdates'].nil?
      result['pushTypeAvailable'] = json_hash['pushTypeAvailable'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['pushTypeAvailable'].nil?

      result
    end
  end
end
