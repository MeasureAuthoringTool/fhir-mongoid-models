module FHIR
  # fhir/medication_dispense.rb
  class MedicationDispense < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::MedicationDispenseStatus'    
    embeds_one :statusReasonCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :statusReasonReference, class_name: 'FHIR::Reference'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationReference, class_name: 'FHIR::Reference'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :context, class_name: 'FHIR::Reference'    
    embeds_many :supportingInformation, class_name: 'FHIR::Reference'    
    embeds_many :performer, class_name: 'FHIR::MedicationDispensePerformer'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_many :authorizingPrescription, class_name: 'FHIR::Reference'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :daysSupply, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :whenPrepared, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :whenHandedOver, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :destination, class_name: 'FHIR::Reference'    
    embeds_many :receiver, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :dosageInstruction, class_name: 'FHIR::Dosage'    
    embeds_one :substitution, class_name: 'FHIR::MedicationDispenseSubstitution'    
    embeds_many :detectedIssue, class_name: 'FHIR::Reference'    
    embeds_many :eventHistory, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusReasonCodeableConcept.nil?
        result['statusReasonCodeableConcept'] = self.statusReasonCodeableConcept.as_json(*args)                        
      end          
      unless self.statusReasonReference.nil?
        result['statusReasonReference'] = self.statusReasonReference.as_json(*args)                        
      end          
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
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
      unless self.context.nil? 
        result['context'] = self.context.as_json(*args)
      end
      unless self.supportingInformation.nil?  || !self.supportingInformation.any? 
        result['supportingInformation'] = self.supportingInformation.map{ |x| x.as_json(*args) }
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.authorizingPrescription.nil?  || !self.authorizingPrescription.any? 
        result['authorizingPrescription'] = self.authorizingPrescription.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.daysSupply.nil? 
        result['daysSupply'] = self.daysSupply.as_json(*args)
      end
      unless self.whenPrepared.nil? 
        result['whenPrepared'] = self.whenPrepared.value
        serialized = Extension.serializePrimitiveExtension(self.whenPrepared)            
        result['_whenPrepared'] = serialized unless serialized.nil?
      end
      unless self.whenHandedOver.nil? 
        result['whenHandedOver'] = self.whenHandedOver.value
        serialized = Extension.serializePrimitiveExtension(self.whenHandedOver)            
        result['_whenHandedOver'] = serialized unless serialized.nil?
      end
      unless self.destination.nil? 
        result['destination'] = self.destination.as_json(*args)
      end
      unless self.receiver.nil?  || !self.receiver.any? 
        result['receiver'] = self.receiver.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.dosageInstruction.nil?  || !self.dosageInstruction.any? 
        result['dosageInstruction'] = self.dosageInstruction.map{ |x| x.as_json(*args) }
      end
      unless self.substitution.nil? 
        result['substitution'] = self.substitution.as_json(*args)
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

    def self.transform_json(json_hash, target = MedicationDispense.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MedicationDispenseStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReasonCodeableConcept'] = CodeableConcept.transform_json(json_hash['statusReasonCodeableConcept']) unless json_hash['statusReasonCodeableConcept'].nil?
      result['statusReasonReference'] = Reference.transform_json(json_hash['statusReasonReference']) unless json_hash['statusReasonReference'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['performer'] = json_hash['performer'].map { |var| MedicationDispensePerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['authorizingPrescription'] = json_hash['authorizingPrescription'].map { |var| Reference.transform_json(var) } unless json_hash['authorizingPrescription'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['daysSupply'] = SimpleQuantity.transform_json(json_hash['daysSupply']) unless json_hash['daysSupply'].nil?
      result['whenPrepared'] = PrimitiveDateTime.transform_json(json_hash['whenPrepared'], json_hash['_whenPrepared']) unless json_hash['whenPrepared'].nil?
      result['whenHandedOver'] = PrimitiveDateTime.transform_json(json_hash['whenHandedOver'], json_hash['_whenHandedOver']) unless json_hash['whenHandedOver'].nil?
      result['destination'] = Reference.transform_json(json_hash['destination']) unless json_hash['destination'].nil?
      result['receiver'] = json_hash['receiver'].map { |var| Reference.transform_json(var) } unless json_hash['receiver'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosageInstruction'] = json_hash['dosageInstruction'].map { |var| Dosage.transform_json(var) } unless json_hash['dosageInstruction'].nil?
      result['substitution'] = MedicationDispenseSubstitution.transform_json(json_hash['substitution']) unless json_hash['substitution'].nil?
      result['detectedIssue'] = json_hash['detectedIssue'].map { |var| Reference.transform_json(var) } unless json_hash['detectedIssue'].nil?
      result['eventHistory'] = json_hash['eventHistory'].map { |var| Reference.transform_json(var) } unless json_hash['eventHistory'].nil?

      result
    end
  end
end
