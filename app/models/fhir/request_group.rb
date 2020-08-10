module FHIR
  # fhir/request_group.rb
  class RequestGroup < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :replaces, class_name: 'FHIR::Reference'    
    embeds_one :groupIdentifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::RequestStatus'    
    embeds_one :intent, class_name: 'FHIR::RequestIntent'    
    embeds_one :priority, class_name: 'FHIR::RequestPriority'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :action, class_name: 'FHIR::RequestGroupAction'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.instantiatesCanonical.nil?  || !self.instantiatesCanonical.any? 
        result['instantiatesCanonical'] = self.instantiatesCanonical.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiatesCanonical)                              
        result['_instantiatesCanonical'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.instantiatesUri.nil?  || !self.instantiatesUri.any? 
        result['instantiatesUri'] = self.instantiatesUri.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiatesUri)                              
        result['_instantiatesUri'] = serialized unless serialized.nil? || !serialized.any?
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
      unless self.intent.nil? 
        result['intent'] = self.intent.value
        serialized = Extension.serializePrimitiveExtension(self.intent)            
        result['_intent'] = serialized unless serialized.nil?
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.value
        serialized = Extension.serializePrimitiveExtension(self.priority)            
        result['_priority'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.authoredOn.nil? 
        result['authoredOn'] = self.authoredOn.value
        serialized = Extension.serializePrimitiveExtension(self.authoredOn)            
        result['_authoredOn'] = serialized unless serialized.nil?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
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
      unless self.action.nil?  || !self.action.any? 
        result['action'] = self.action.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = RequestGroup.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['replaces'] = json_hash['replaces'].map { |var| Reference.transform_json(var) } unless json_hash['replaces'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?
      result['status'] = RequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['intent'] = RequestIntent.transform_json(json_hash['intent'], json_hash['_intent']) unless json_hash['intent'].nil?
      result['priority'] = RequestPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['action'] = json_hash['action'].map { |var| RequestGroupAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
