module FHIR
  # fhir/enrollment_request.rb
  class EnrollmentRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::EnrollmentRequestStatus'    
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :insurer, class_name: 'FHIR::Reference'    
    embeds_one :provider, class_name: 'FHIR::Reference'    
    embeds_one :candidate, class_name: 'FHIR::Reference'    
    embeds_one :coverage, class_name: 'FHIR::Reference'    
    
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
      unless self.created.nil? 
        result['created'] = self.created.value
        serialized = Extension.serializePrimitiveExtension(self.created)            
        result['_created'] = serialized unless serialized.nil?
      end
      unless self.insurer.nil? 
        result['insurer'] = self.insurer.as_json(*args)
      end
      unless self.provider.nil? 
        result['provider'] = self.provider.as_json(*args)
      end
      unless self.candidate.nil? 
        result['candidate'] = self.candidate.as_json(*args)
      end
      unless self.coverage.nil? 
        result['coverage'] = self.coverage.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EnrollmentRequest.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EnrollmentRequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?
      result['candidate'] = Reference.transform_json(json_hash['candidate']) unless json_hash['candidate'].nil?
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?

      result
    end
  end
end
