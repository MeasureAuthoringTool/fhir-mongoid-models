module FHIR
  # fhir/service_request.rb
  class ServiceRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :replaces, class_name: 'FHIR::Reference'    
    embeds_one :requisition, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ServiceRequestStatus'    
    embeds_one :intent, class_name: 'FHIR::ServiceRequestIntent'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::ServiceRequestPriority'    
    embeds_one :doNotPerform, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :orderDetail, class_name: 'FHIR::CodeableConcept'    
    embeds_one :quantityQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :quantityRatio, class_name: 'FHIR::Ratio'    
    embeds_one :quantityRange, class_name: 'FHIR::Range'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :occurrenceTiming, class_name: 'FHIR::Timing'    
    embeds_one :asNeededBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :asNeededCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requester, class_name: 'FHIR::Reference'    
    embeds_one :performerType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :performer, class_name: 'FHIR::Reference'    
    embeds_many :locationCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :locationReference, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :insurance, class_name: 'FHIR::Reference'    
    embeds_many :supportingInfo, class_name: 'FHIR::Reference'    
    embeds_many :specimen, class_name: 'FHIR::Reference'    
    embeds_many :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_one :patientInstruction, class_name: 'FHIR::PrimitiveString'    
    embeds_many :relevantHistory, class_name: 'FHIR::Reference'    
    
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
      unless self.requisition.nil? 
        result['requisition'] = self.requisition.as_json(*args)
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
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.orderDetail.nil?  || !self.orderDetail.any? 
        result['orderDetail'] = self.orderDetail.map{ |x| x.as_json(*args) }
      end
      unless self.quantityQuantity.nil?
        result['quantityQuantity'] = self.quantityQuantity.as_json(*args)                        
      end          
      unless self.quantityRatio.nil?
        result['quantityRatio'] = self.quantityRatio.as_json(*args)                        
      end          
      unless self.quantityRange.nil?
        result['quantityRange'] = self.quantityRange.as_json(*args)                        
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
      unless self.occurrencePeriod.nil?
        result['occurrencePeriod'] = self.occurrencePeriod.as_json(*args)                        
      end          
      unless self.occurrenceTiming.nil?
        result['occurrenceTiming'] = self.occurrenceTiming.as_json(*args)                        
      end          
      unless self.asNeededBoolean.nil?
        result['asNeededBoolean'] = self.asNeededBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.asNeededBoolean) 
        result['_asNeededBoolean'] = serialized unless serialized.nil?
      end          
      unless self.asNeededCodeableConcept.nil?
        result['asNeededCodeableConcept'] = self.asNeededCodeableConcept.as_json(*args)                        
      end          
      unless self.authoredOn.nil? 
        result['authoredOn'] = self.authoredOn.value
        serialized = Extension.serializePrimitiveExtension(self.authoredOn)            
        result['_authoredOn'] = serialized unless serialized.nil?
      end
      unless self.requester.nil? 
        result['requester'] = self.requester.as_json(*args)
      end
      unless self.performerType.nil? 
        result['performerType'] = self.performerType.as_json(*args)
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.locationCode.nil?  || !self.locationCode.any? 
        result['locationCode'] = self.locationCode.map{ |x| x.as_json(*args) }
      end
      unless self.locationReference.nil?  || !self.locationReference.any? 
        result['locationReference'] = self.locationReference.map{ |x| x.as_json(*args) }
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.supportingInfo.nil?  || !self.supportingInfo.any? 
        result['supportingInfo'] = self.supportingInfo.map{ |x| x.as_json(*args) }
      end
      unless self.specimen.nil?  || !self.specimen.any? 
        result['specimen'] = self.specimen.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil?  || !self.bodySite.any? 
        result['bodySite'] = self.bodySite.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.patientInstruction.nil? 
        result['patientInstruction'] = self.patientInstruction.value
        serialized = Extension.serializePrimitiveExtension(self.patientInstruction)            
        result['_patientInstruction'] = serialized unless serialized.nil?
      end
      unless self.relevantHistory.nil?  || !self.relevantHistory.any? 
        result['relevantHistory'] = self.relevantHistory.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ServiceRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['basedOn'].nil?
      result['replaces'] = json_hash['replaces'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['replaces'].nil?
      result['requisition'] = Identifier.transform_json(json_hash['requisition']) unless json_hash['requisition'].nil?
      result['status'] = ServiceRequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['intent'] = ServiceRequestIntent.transform_json(json_hash['intent'], json_hash['_intent']) unless json_hash['intent'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['priority'] = ServiceRequestPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['orderDetail'] = json_hash['orderDetail'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['orderDetail'].nil?
      result['quantityQuantity'] = Quantity.transform_json(json_hash['quantityQuantity']) unless json_hash['quantityQuantity'].nil?
      result['quantityRatio'] = Ratio.transform_json(json_hash['quantityRatio']) unless json_hash['quantityRatio'].nil?
      result['quantityRange'] = Range.transform_json(json_hash['quantityRange']) unless json_hash['quantityRange'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?
      result['asNeededBoolean'] = PrimitiveBoolean.transform_json(json_hash['asNeededBoolean'], json_hash['_asNeededBoolean']) unless json_hash['asNeededBoolean'].nil?
      result['asNeededCodeableConcept'] = CodeableConcept.transform_json(json_hash['asNeededCodeableConcept']) unless json_hash['asNeededCodeableConcept'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?
      result['performerType'] = CodeableConcept.transform_json(json_hash['performerType']) unless json_hash['performerType'].nil?
      result['performer'] = json_hash['performer'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['performer'].nil?
      result['locationCode'] = json_hash['locationCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['locationCode'].nil?
      result['locationReference'] = json_hash['locationReference'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['locationReference'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['reasonReference'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['insurance'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['supportingInfo'].nil?
      result['specimen'] = json_hash['specimen'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['specimen'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['bodySite'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['patientInstruction'] = PrimitiveString.transform_json(json_hash['patientInstruction'], json_hash['_patientInstruction']) unless json_hash['patientInstruction'].nil?
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['relevantHistory'].nil?

      result
    end
  end
end
