module FHIR
  # fhir/medication_administration.rb
  class MedicationAdministration < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :instantiates, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::MedicationAdministrationStatus'    
    embeds_many :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationReference, class_name: 'FHIR::Reference'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :context, class_name: 'FHIR::Reference'    
    embeds_many :supportingInformation, class_name: 'FHIR::Reference'    
    embeds_one :effectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_many :performer, class_name: 'FHIR::MedicationAdministrationPerformer'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_one :request, class_name: 'FHIR::Reference'    
    embeds_many :device, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_one :dosage, class_name: 'FHIR::MedicationAdministrationDosage'    
    embeds_many :eventHistory, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.instantiates.nil?  || !self.instantiates.any? 
        result['instantiates'] = self.instantiates.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.instantiates)                              
        result['_instantiates'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.statusReason.nil?  || !self.statusReason.any? 
        result['statusReason'] = self.statusReason.map{ |x| x.as_json(*args) }
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
      unless self.effectiveDateTime.nil?
        result['effectiveDateTime'] = self.effectiveDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.effectiveDateTime) 
        result['_effectiveDateTime'] = serialized unless serialized.nil?
      end          
      unless self.effectivePeriod.nil?
        result['effectivePeriod'] = self.effectivePeriod.as_json(*args)                        
      end          
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.request.nil? 
        result['request'] = self.request.as_json(*args)
      end
      unless self.device.nil?  || !self.device.any? 
        result['device'] = self.device.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.dosage.nil? 
        result['dosage'] = self.dosage.as_json(*args)
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

    def self.transform_json(json_hash, target = MedicationAdministration.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiates'] = json_hash['instantiates'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiates'] && json_hash['_instantiates'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiates'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MedicationAdministrationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = json_hash['statusReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['statusReason'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['performer'] = json_hash['performer'].map { |var| MedicationAdministrationPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?
      result['device'] = json_hash['device'].map { |var| Reference.transform_json(var) } unless json_hash['device'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosage'] = MedicationAdministrationDosage.transform_json(json_hash['dosage']) unless json_hash['dosage'].nil?
      result['eventHistory'] = json_hash['eventHistory'].map { |var| Reference.transform_json(var) } unless json_hash['eventHistory'].nil?

      result
    end
  end
end
