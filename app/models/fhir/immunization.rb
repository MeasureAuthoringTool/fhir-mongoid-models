module FHIR
  # fhir/immunization.rb
  class Immunization < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ImmunizationStatus'    
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :vaccineCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrenceString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :recorded, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :primarySource, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :reportOrigin, class_name: 'FHIR::CodeableConcept'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_one :manufacturer, class_name: 'FHIR::Reference'    
    embeds_one :lotNumber, class_name: 'FHIR::PrimitiveString'    
    embeds_one :expirationDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :site, class_name: 'FHIR::CodeableConcept'    
    embeds_one :route, class_name: 'FHIR::CodeableConcept'    
    embeds_one :doseQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_many :performer, class_name: 'FHIR::ImmunizationPerformer'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_one :isSubpotent, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :subpotentReason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :education, class_name: 'FHIR::ImmunizationEducation'    
    embeds_many :programEligibility, class_name: 'FHIR::CodeableConcept'    
    embeds_one :fundingSource, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reaction, class_name: 'FHIR::ImmunizationReaction'    
    embeds_many :protocolApplied, class_name: 'FHIR::ImmunizationProtocolApplied'    
    
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
      unless self.vaccineCode.nil? 
        result['vaccineCode'] = self.vaccineCode.as_json(*args)
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.occurrenceDateTime.nil?
        result['occurrenceDateTime'] = self.occurrenceDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurrenceDateTime) 
        result['_occurrenceDateTime'] = serialized unless serialized.nil?
      end          
      unless self.occurrenceString.nil?
        result['occurrenceString'] = self.occurrenceString.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurrenceString) 
        result['_occurrenceString'] = serialized unless serialized.nil?
      end          
      unless self.recorded.nil? 
        result['recorded'] = self.recorded.value
        serialized = Extension.serializePrimitiveExtension(self.recorded)            
        result['_recorded'] = serialized unless serialized.nil?
      end
      unless self.primarySource.nil? 
        result['primarySource'] = self.primarySource.value
        serialized = Extension.serializePrimitiveExtension(self.primarySource)            
        result['_primarySource'] = serialized unless serialized.nil?
      end
      unless self.reportOrigin.nil? 
        result['reportOrigin'] = self.reportOrigin.as_json(*args)
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.manufacturer.nil? 
        result['manufacturer'] = self.manufacturer.as_json(*args)
      end
      unless self.lotNumber.nil? 
        result['lotNumber'] = self.lotNumber.value
        serialized = Extension.serializePrimitiveExtension(self.lotNumber)            
        result['_lotNumber'] = serialized unless serialized.nil?
      end
      unless self.expirationDate.nil? 
        result['expirationDate'] = self.expirationDate.value
        serialized = Extension.serializePrimitiveExtension(self.expirationDate)            
        result['_expirationDate'] = serialized unless serialized.nil?
      end
      unless self.site.nil? 
        result['site'] = self.site.as_json(*args)
      end
      unless self.route.nil? 
        result['route'] = self.route.as_json(*args)
      end
      unless self.doseQuantity.nil? 
        result['doseQuantity'] = self.doseQuantity.as_json(*args)
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.isSubpotent.nil? 
        result['isSubpotent'] = self.isSubpotent.value
        serialized = Extension.serializePrimitiveExtension(self.isSubpotent)            
        result['_isSubpotent'] = serialized unless serialized.nil?
      end
      unless self.subpotentReason.nil?  || !self.subpotentReason.any? 
        result['subpotentReason'] = self.subpotentReason.map{ |x| x.as_json(*args) }
      end
      unless self.education.nil?  || !self.education.any? 
        result['education'] = self.education.map{ |x| x.as_json(*args) }
      end
      unless self.programEligibility.nil?  || !self.programEligibility.any? 
        result['programEligibility'] = self.programEligibility.map{ |x| x.as_json(*args) }
      end
      unless self.fundingSource.nil? 
        result['fundingSource'] = self.fundingSource.as_json(*args)
      end
      unless self.reaction.nil?  || !self.reaction.any? 
        result['reaction'] = self.reaction.map{ |x| x.as_json(*args) }
      end
      unless self.protocolApplied.nil?  || !self.protocolApplied.any? 
        result['protocolApplied'] = self.protocolApplied.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Immunization.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ImmunizationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?
      result['vaccineCode'] = CodeableConcept.transform_json(json_hash['vaccineCode']) unless json_hash['vaccineCode'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrenceString'] = PrimitiveString.transform_json(json_hash['occurrenceString'], json_hash['_occurrenceString']) unless json_hash['occurrenceString'].nil?
      result['recorded'] = PrimitiveDateTime.transform_json(json_hash['recorded'], json_hash['_recorded']) unless json_hash['recorded'].nil?
      result['primarySource'] = PrimitiveBoolean.transform_json(json_hash['primarySource'], json_hash['_primarySource']) unless json_hash['primarySource'].nil?
      result['reportOrigin'] = CodeableConcept.transform_json(json_hash['reportOrigin']) unless json_hash['reportOrigin'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['manufacturer'] = Reference.transform_json(json_hash['manufacturer']) unless json_hash['manufacturer'].nil?
      result['lotNumber'] = PrimitiveString.transform_json(json_hash['lotNumber'], json_hash['_lotNumber']) unless json_hash['lotNumber'].nil?
      result['expirationDate'] = PrimitiveDate.transform_json(json_hash['expirationDate'], json_hash['_expirationDate']) unless json_hash['expirationDate'].nil?
      result['site'] = CodeableConcept.transform_json(json_hash['site']) unless json_hash['site'].nil?
      result['route'] = CodeableConcept.transform_json(json_hash['route']) unless json_hash['route'].nil?
      result['doseQuantity'] = SimpleQuantity.transform_json(json_hash['doseQuantity']) unless json_hash['doseQuantity'].nil?
      result['performer'] = json_hash['performer'].map { |var| ImmunizationPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['isSubpotent'] = PrimitiveBoolean.transform_json(json_hash['isSubpotent'], json_hash['_isSubpotent']) unless json_hash['isSubpotent'].nil?
      result['subpotentReason'] = json_hash['subpotentReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subpotentReason'].nil?
      result['education'] = json_hash['education'].map { |var| ImmunizationEducation.transform_json(var) } unless json_hash['education'].nil?
      result['programEligibility'] = json_hash['programEligibility'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programEligibility'].nil?
      result['fundingSource'] = CodeableConcept.transform_json(json_hash['fundingSource']) unless json_hash['fundingSource'].nil?
      result['reaction'] = json_hash['reaction'].map { |var| ImmunizationReaction.transform_json(var) } unless json_hash['reaction'].nil?
      result['protocolApplied'] = json_hash['protocolApplied'].map { |var| ImmunizationProtocolApplied.transform_json(var) } unless json_hash['protocolApplied'].nil?

      result
    end
  end
end
