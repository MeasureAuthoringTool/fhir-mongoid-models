module FHIR
  # fhir/task.rb
  class Task < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_one :groupIdentifier, class_name: 'FHIR::Identifier'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::TaskStatus'    
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :businessStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intent, class_name: 'FHIR::TaskIntent'    
    embeds_one :priority, class_name: 'FHIR::TaskPriority'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :focus, class_name: 'FHIR::Reference'    
    embeds_one :for, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :executionPeriod, class_name: 'FHIR::Period'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :lastModified, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requester, class_name: 'FHIR::Reference'    
    embeds_many :performerType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :owner, class_name: 'FHIR::Reference'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_one :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :insurance, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :relevantHistory, class_name: 'FHIR::Reference'    
    embeds_one :restriction, class_name: 'FHIR::TaskRestriction'    
    embeds_many :input, class_name: 'FHIR::TaskInput'    
    embeds_many :output, class_name: 'FHIR::TaskOutput'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.instantiatesCanonical.nil? 
        result['instantiatesCanonical'] = self.instantiatesCanonical.value
        serialized = Extension.serializePrimitiveExtension(self.instantiatesCanonical)            
        result['_instantiatesCanonical'] = serialized unless serialized.nil?
      end
      unless self.instantiatesUri.nil? 
        result['instantiatesUri'] = self.instantiatesUri.value
        serialized = Extension.serializePrimitiveExtension(self.instantiatesUri)            
        result['_instantiatesUri'] = serialized unless serialized.nil?
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.groupIdentifier.nil? 
        result['groupIdentifier'] = self.groupIdentifier.as_json(*args)
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusReason.nil? 
        result['statusReason'] = self.statusReason.as_json(*args)
      end
      unless self.businessStatus.nil? 
        result['businessStatus'] = self.businessStatus.as_json(*args)
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
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.focus.nil? 
        result['focus'] = self.focus.as_json(*args)
      end
      unless self.for.nil? 
        result['for'] = self.for.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.executionPeriod.nil? 
        result['executionPeriod'] = self.executionPeriod.as_json(*args)
      end
      unless self.authoredOn.nil? 
        result['authoredOn'] = self.authoredOn.value
        serialized = Extension.serializePrimitiveExtension(self.authoredOn)            
        result['_authoredOn'] = serialized unless serialized.nil?
      end
      unless self.lastModified.nil? 
        result['lastModified'] = self.lastModified.value
        serialized = Extension.serializePrimitiveExtension(self.lastModified)            
        result['_lastModified'] = serialized unless serialized.nil?
      end
      unless self.requester.nil? 
        result['requester'] = self.requester.as_json(*args)
      end
      unless self.performerType.nil?  || !self.performerType.any? 
        result['performerType'] = self.performerType.map{ |x| x.as_json(*args) }
      end
      unless self.owner.nil? 
        result['owner'] = self.owner.as_json(*args)
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.reasonCode.nil? 
        result['reasonCode'] = self.reasonCode.as_json(*args)
      end
      unless self.reasonReference.nil? 
        result['reasonReference'] = self.reasonReference.as_json(*args)
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.relevantHistory.nil?  || !self.relevantHistory.any? 
        result['relevantHistory'] = self.relevantHistory.map{ |x| x.as_json(*args) }
      end
      unless self.restriction.nil? 
        result['restriction'] = self.restriction.as_json(*args)
      end
      unless self.input.nil?  || !self.input.any? 
        result['input'] = self.input.map{ |x| x.as_json(*args) }
      end
      unless self.output.nil?  || !self.output.any? 
        result['output'] = self.output.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Task.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = PrimitiveCanonical.transform_json(json_hash['instantiatesCanonical'], json_hash['_instantiatesCanonical']) unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = PrimitiveUri.transform_json(json_hash['instantiatesUri'], json_hash['_instantiatesUri']) unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['basedOn'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['partOf'].nil?
      result['status'] = TaskStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?
      result['businessStatus'] = CodeableConcept.transform_json(json_hash['businessStatus']) unless json_hash['businessStatus'].nil?
      result['intent'] = TaskIntent.transform_json(json_hash['intent'], json_hash['_intent']) unless json_hash['intent'].nil?
      result['priority'] = TaskPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['focus'] = Reference.transform_json(json_hash['focus']) unless json_hash['focus'].nil?
      result['for'] = Reference.transform_json(json_hash['for']) unless json_hash['for'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['executionPeriod'] = Period.transform_json(json_hash['executionPeriod']) unless json_hash['executionPeriod'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?
      result['lastModified'] = PrimitiveDateTime.transform_json(json_hash['lastModified'], json_hash['_lastModified']) unless json_hash['lastModified'].nil?
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?
      result['performerType'] = json_hash['performerType'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['performerType'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['reasonCode'] = CodeableConcept.transform_json(json_hash['reasonCode']) unless json_hash['reasonCode'].nil?
      result['reasonReference'] = Reference.transform_json(json_hash['reasonReference']) unless json_hash['reasonReference'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['insurance'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['relevantHistory'].nil?
      result['restriction'] = TaskRestriction.transform_json(json_hash['restriction']) unless json_hash['restriction'].nil?
      result['input'] = json_hash['input'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          TaskInput.transform_json(var) 
        end
      } unless json_hash['input'].nil?
      result['output'] = json_hash['output'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          TaskOutput.transform_json(var) 
        end
      } unless json_hash['output'].nil?

      result
    end
  end
end
