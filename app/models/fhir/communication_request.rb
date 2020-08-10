module FHIR
  # fhir/communication_request.rb
  class CommunicationRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :replaces, class_name: 'FHIR::Reference'    
    embeds_one :groupIdentifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::CommunicationRequestStatus'    
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::CommunicationPriority'    
    embeds_one :doNotPerform, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :medium, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_many :about, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_many :payload, class_name: 'FHIR::CommunicationRequestPayload'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requester, class_name: 'FHIR::Reference'    
    embeds_many :recipient, class_name: 'FHIR::Reference'    
    embeds_one :sender, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.replaces.nil?  || !self.replaces.any? 
        result['replaces'] = self.replaces.map{ |x| x.as_json(*args) }
      end
      unless self.groupIdentifier.nil? 
        result['groupIdentifier'] = self.groupIdentifier.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusReason.nil? 
        result['statusReason'] = self.statusReason.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      unless self.doNotPerform.nil? 
        result['doNotPerform'] = self.doNotPerform.value
        serialized = Extension.serializePrimitiveExtension(self.doNotPerform)            
        result['_doNotPerform'] = serialized unless serialized.nil?
      end
      unless self.medium.nil?  || !self.medium.any? 
        result['medium'] = self.medium.map{ |x| x.as_json(*args) }
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.about.nil?  || !self.about.any? 
        result['about'] = self.about.map{ |x| x.as_json(*args) }
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.payload.nil?  || !self.payload.any? 
        result['payload'] = self.payload.map{ |x| x.as_json(*args) }
      end
      unless self.occurrenceDateTime.nil?
        result['occurrenceDateTime'] = self.occurrenceDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurrenceDateTime) 
        result['_occurrenceDateTime'] = serialized unless serialized.nil?
      end          
      unless self.occurrencePeriod.nil?
        result['occurrencePeriod'] = self.occurrencePeriod.as_json(*args)                        
      end          
      unless self.authoredOn.nil? 
        result['authoredOn'] = self.authoredOn.value
        serialized = Extension.serializePrimitiveExtension(self.authoredOn)            
        result['_authoredOn'] = serialized unless serialized.nil?
      end
      unless self.requester.nil? 
        result['requester'] = self.requester.as_json(*args)
      end
      unless self.recipient.nil?  || !self.recipient.any? 
        result['recipient'] = self.recipient.map{ |x| x.as_json(*args) }
      end
      unless self.sender.nil? 
        result['sender'] = self.sender.as_json(*args)
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
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CommunicationRequest.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['replaces'] = json_hash['replaces'].map { |var| Reference.transform_json(var) } unless json_hash['replaces'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?
      result['status'] = CommunicationRequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = CommunicationPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?
      result['medium'] = json_hash['medium'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['medium'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['about'] = json_hash['about'].map { |var| Reference.transform_json(var) } unless json_hash['about'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['payload'] = json_hash['payload'].map { |var| CommunicationRequestPayload.transform_json(var) } unless json_hash['payload'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?
      result['recipient'] = json_hash['recipient'].map { |var| Reference.transform_json(var) } unless json_hash['recipient'].nil?
      result['sender'] = Reference.transform_json(json_hash['sender']) unless json_hash['sender'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
