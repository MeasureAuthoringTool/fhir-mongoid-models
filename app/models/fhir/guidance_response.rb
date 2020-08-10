module FHIR
  # fhir/guidance_response.rb
  class GuidanceResponse < DomainResource
    include Mongoid::Document
    embeds_one :requestIdentifier, class_name: 'FHIR::Identifier'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :moduleUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :moduleCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :moduleCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::GuidanceResponseStatus'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :performer, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :evaluationMessage, class_name: 'FHIR::Reference'    
    embeds_one :outputParameters, class_name: 'FHIR::Reference'    
    embeds_one :result, class_name: 'FHIR::Reference'    
    embeds_many :dataRequirement, class_name: 'FHIR::DataRequirement'    
    
    def as_json(*args)
      result = super      
      unless self.requestIdentifier.nil? 
        result['requestIdentifier'] = self.requestIdentifier.as_json(*args)
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.moduleUri.nil?
        result['moduleUri'] = self.moduleUri.value                        
        serialized = Extension.serializePrimitiveExtension(self.moduleUri) 
        result['_moduleUri'] = serialized unless serialized.nil?
      end          
      unless self.moduleCanonical.nil?
        result['moduleCanonical'] = self.moduleCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.moduleCanonical) 
        result['_moduleCanonical'] = serialized unless serialized.nil?
      end          
      unless self.moduleCodeableConcept.nil?
        result['moduleCodeableConcept'] = self.moduleCodeableConcept.as_json(*args)                        
      end          
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.occurrenceDateTime.nil? 
        result['occurrenceDateTime'] = self.occurrenceDateTime.value
        serialized = Extension.serializePrimitiveExtension(self.occurrenceDateTime)            
        result['_occurrenceDateTime'] = serialized unless serialized.nil?
      end
      unless self.performer.nil? 
        result['performer'] = self.performer.as_json(*args)
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.evaluationMessage.nil?  || !self.evaluationMessage.any? 
        result['evaluationMessage'] = self.evaluationMessage.map{ |x| x.as_json(*args) }
      end
      unless self.outputParameters.nil? 
        result['outputParameters'] = self.outputParameters.as_json(*args)
      end
      unless self.result.nil? 
        result['result'] = self.result.as_json(*args)
      end
      unless self.dataRequirement.nil?  || !self.dataRequirement.any? 
        result['dataRequirement'] = self.dataRequirement.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GuidanceResponse.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['requestIdentifier'] = Identifier.transform_json(json_hash['requestIdentifier']) unless json_hash['requestIdentifier'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['moduleUri'] = PrimitiveUri.transform_json(json_hash['moduleUri'], json_hash['_moduleUri']) unless json_hash['moduleUri'].nil?
      result['moduleCanonical'] = PrimitiveCanonical.transform_json(json_hash['moduleCanonical'], json_hash['_moduleCanonical']) unless json_hash['moduleCanonical'].nil?
      result['moduleCodeableConcept'] = CodeableConcept.transform_json(json_hash['moduleCodeableConcept']) unless json_hash['moduleCodeableConcept'].nil?
      result['status'] = GuidanceResponseStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['evaluationMessage'] = json_hash['evaluationMessage'].map { |var| Reference.transform_json(var) } unless json_hash['evaluationMessage'].nil?
      result['outputParameters'] = Reference.transform_json(json_hash['outputParameters']) unless json_hash['outputParameters'].nil?
      result['result'] = Reference.transform_json(json_hash['result']) unless json_hash['result'].nil?
      result['dataRequirement'] = json_hash['dataRequirement'].map { |var| DataRequirement.transform_json(var) } unless json_hash['dataRequirement'].nil?

      result
    end
  end
end
