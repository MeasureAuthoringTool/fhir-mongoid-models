module FHIR
  # fhir/medication_statement.rb
  class MedicationStatement < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::MedicationStatementStatus'    
    embeds_many :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationReference, class_name: 'FHIR::Reference'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :context, class_name: 'FHIR::Reference'    
    embeds_one :effectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :dateAsserted, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :informationSource, class_name: 'FHIR::Reference'    
    embeds_many :derivedFrom, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :dosage, class_name: 'FHIR::Dosage'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
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
      unless self.effectiveDateTime.nil?
        result['effectiveDateTime'] = self.effectiveDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.effectiveDateTime) 
        result['_effectiveDateTime'] = serialized unless serialized.nil?
      end          
      unless self.effectivePeriod.nil?
        result['effectivePeriod'] = self.effectivePeriod.as_json(*args)                        
      end          
      unless self.dateAsserted.nil? 
        result['dateAsserted'] = self.dateAsserted.value
        serialized = Extension.serializePrimitiveExtension(self.dateAsserted)            
        result['_dateAsserted'] = serialized unless serialized.nil?
      end
      unless self.informationSource.nil? 
        result['informationSource'] = self.informationSource.as_json(*args)
      end
      unless self.derivedFrom.nil?  || !self.derivedFrom.any? 
        result['derivedFrom'] = self.derivedFrom.map{ |x| x.as_json(*args) }
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
      unless self.dosage.nil?  || !self.dosage.any? 
        result['dosage'] = self.dosage.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationStatement.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = MedicationStatementStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = json_hash['statusReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['statusReason'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['dateAsserted'] = PrimitiveDateTime.transform_json(json_hash['dateAsserted'], json_hash['_dateAsserted']) unless json_hash['dateAsserted'].nil?
      result['informationSource'] = Reference.transform_json(json_hash['informationSource']) unless json_hash['informationSource'].nil?
      result['derivedFrom'] = json_hash['derivedFrom'].map { |var| Reference.transform_json(var) } unless json_hash['derivedFrom'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['dosage'] = json_hash['dosage'].map { |var| Dosage.transform_json(var) } unless json_hash['dosage'].nil?

      result
    end
  end
end
