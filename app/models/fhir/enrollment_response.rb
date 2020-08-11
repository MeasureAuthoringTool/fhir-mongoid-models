module FHIR
  # fhir/enrollment_response.rb
  class EnrollmentResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::EnrollmentResponseStatus'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'    
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :organization, class_name: 'FHIR::Reference'    
    embeds_one :requestProvider, class_name: 'FHIR::Reference'    
    
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
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.organization.nil? 
        result['organization'] = self.organization.as_json(*args)
      end
      unless self.requestProvider.nil? 
        result['requestProvider'] = self.requestProvider.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EnrollmentResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EnrollmentResponseStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome'], json_hash['_outcome']) unless json_hash['outcome'].nil?
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?
      result['requestProvider'] = Reference.transform_json(json_hash['requestProvider']) unless json_hash['requestProvider'].nil?

      result
    end
  end
end
