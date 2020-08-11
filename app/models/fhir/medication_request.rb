module FHIR
  # fhir/medication_request.rb
  class MedicationRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::MedicationRequestStatus'    
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intent, class_name: 'FHIR::MedicationRequestIntent'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::MedicationRequestPriority'    
    embeds_one :doNotPerform, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :reportedBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :reportedReference, class_name: 'FHIR::Reference'    
    embeds_one :medicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationReference, class_name: 'FHIR::Reference'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_many :supportingInformation, class_name: 'FHIR::Reference'    
    embeds_one :authoredOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :requester, class_name: 'FHIR::Reference'    
    embeds_one :performer, class_name: 'FHIR::Reference'    
    embeds_one :performerType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :recorder, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_one :groupIdentifier, class_name: 'FHIR::Identifier'    
    embeds_one :courseOfTherapyType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :insurance, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :dosageInstruction, class_name: 'FHIR::Dosage'    
    embeds_one :dispenseRequest, class_name: 'FHIR::MedicationRequestDispenseRequest'    
    embeds_one :substitution, class_name: 'FHIR::MedicationRequestSubstitution'    
    embeds_one :priorPrescription, class_name: 'FHIR::Reference'    
    embeds_many :detectedIssue, class_name: 'FHIR::Reference'    
    embeds_many :eventHistory, class_name: 'FHIR::Reference'    
    
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
      unless self.statusReason.nil? 
        result['statusReason'] = self.statusReason.as_json(*args)
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
      unless self.reportedBoolean.nil?
        result['reportedBoolean'] = self.reportedBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.reportedBoolean) 
        result['_reportedBoolean'] = serialized unless serialized.nil?
      end          
      unless self.reportedReference.nil?
        result['reportedReference'] = self.reportedReference.as_json(*args)                        
      end          
      unless self.medicationCodeableConcept.nil?
        result['medicationCodeableConcept'] = self.medicationCodeableConcept.as_json(*args)                        
      end          
      unless self.medicationReference.nil?
        result['medicationReference'] = self.medicationReference.as_json(*args)                        
      end          
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.supportingInformation.nil?  || !self.supportingInformation.any? 
        result['supportingInformation'] = self.supportingInformation.map{ |x| x.as_json(*args) }
      end
      unless self.authoredOn.nil? 
        result['authoredOn'] = self.authoredOn.value
        serialized = Extension.serializePrimitiveExtension(self.authoredOn)            
        result['_authoredOn'] = serialized unless serialized.nil?
      end
      unless self.requester.nil? 
        result['requester'] = self.requester.as_json(*args)
      end
      unless self.performer.nil? 
        result['performer'] = self.performer.as_json(*args)
      end
      unless self.performerType.nil? 
        result['performerType'] = self.performerType.as_json(*args)
      end
      unless self.recorder.nil? 
        result['recorder'] = self.recorder.as_json(*args)
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
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
      unless self.groupIdentifier.nil? 
        result['groupIdentifier'] = self.groupIdentifier.as_json(*args)
      end
      unless self.courseOfTherapyType.nil? 
        result['courseOfTherapyType'] = self.courseOfTherapyType.as_json(*args)
      end
      unless self.insurance.nil?  || !self.insurance.any? 
        result['insurance'] = self.insurance.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.dosageInstruction.nil?  || !self.dosageInstruction.any? 
        result['dosageInstruction'] = self.dosageInstruction.map{ |x| x.as_json(*args) }
      end
      unless self.dispenseRequest.nil? 
        result['dispenseRequest'] = self.dispenseRequest.as_json(*args)
      end
      unless self.substitution.nil? 
        result['substitution'] = self.substitution.as_json(*args)
      end
      unless self.priorPrescription.nil? 
        result['priorPrescription'] = self.priorPrescription.as_json(*args)
      end
      unless self.detectedIssue.nil?  || !self.detectedIssue.any? 
        result['detectedIssue'] = self.detectedIssue.map{ |x| x.as_json(*args) }
      end
      unless self.eventHistory.nil?  || !self.eventHistory.any? 
        result['eventHistory'] = self.eventHistory.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationRequest.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = MedicationRequestStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?
      result['intent'] = MedicationRequestIntent.transform_json(json_hash['intent'], json_hash['_intent']) unless json_hash['intent'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = MedicationRequestPriority.transform_json(json_hash['priority'], json_hash['_priority']) unless json_hash['priority'].nil?
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?
      result['reportedBoolean'] = PrimitiveBoolean.transform_json(json_hash['reportedBoolean'], json_hash['_reportedBoolean']) unless json_hash['reportedBoolean'].nil?
      result['reportedReference'] = Reference.transform_json(json_hash['reportedReference']) unless json_hash['reportedReference'].nil?
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?
      result['performerType'] = CodeableConcept.transform_json(json_hash['performerType']) unless json_hash['performerType'].nil?
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?
      result['courseOfTherapyType'] = CodeableConcept.transform_json(json_hash['courseOfTherapyType']) unless json_hash['courseOfTherapyType'].nil?
      result['insurance'] = json_hash['insurance'].map { |var| Reference.transform_json(var) } unless json_hash['insurance'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosageInstruction'] = json_hash['dosageInstruction'].map { |var| Dosage.transform_json(var) } unless json_hash['dosageInstruction'].nil?
      result['dispenseRequest'] = MedicationRequestDispenseRequest.transform_json(json_hash['dispenseRequest']) unless json_hash['dispenseRequest'].nil?
      result['substitution'] = MedicationRequestSubstitution.transform_json(json_hash['substitution']) unless json_hash['substitution'].nil?
      result['priorPrescription'] = Reference.transform_json(json_hash['priorPrescription']) unless json_hash['priorPrescription'].nil?
      result['detectedIssue'] = json_hash['detectedIssue'].map { |var| Reference.transform_json(var) } unless json_hash['detectedIssue'].nil?
      result['eventHistory'] = json_hash['eventHistory'].map { |var| Reference.transform_json(var) } unless json_hash['eventHistory'].nil?

      result
    end
  end
end
