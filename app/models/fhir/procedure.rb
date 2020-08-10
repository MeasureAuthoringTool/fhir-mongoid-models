module FHIR
  # fhir/procedure.rb
  class Procedure < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :instantiatesCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :instantiatesUri, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::ProcedureStatus'    
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :performedDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :performedPeriod, class_name: 'FHIR::Period'    
    embeds_one :performedString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :performedAge, class_name: 'FHIR::Age'    
    embeds_one :performedRange, class_name: 'FHIR::Range'    
    embeds_one :recorder, class_name: 'FHIR::Reference'    
    embeds_one :asserter, class_name: 'FHIR::Reference'    
    embeds_many :performer, class_name: 'FHIR::ProcedurePerformer'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :outcome, class_name: 'FHIR::CodeableConcept'    
    embeds_many :report, class_name: 'FHIR::Reference'    
    embeds_many :complication, class_name: 'FHIR::CodeableConcept'    
    embeds_many :complicationDetail, class_name: 'FHIR::Reference'    
    embeds_many :followUp, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :focalDevice, class_name: 'FHIR::ProcedureFocalDevice'    
    embeds_many :usedReference, class_name: 'FHIR::Reference'    
    embeds_many :usedCode, class_name: 'FHIR::CodeableConcept'    
    
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
      unless self.category.nil? 
        result['category'] = self.category.as_json(*args)
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
      unless self.performedDateTime.nil?
        result['performedDateTime'] = self.performedDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.performedDateTime) 
        result['_performedDateTime'] = serialized unless serialized.nil?
      end          
      unless self.performedPeriod.nil?
        result['performedPeriod'] = self.performedPeriod.as_json(*args)                        
      end          
      unless self.performedString.nil?
        result['performedString'] = self.performedString.value                        
        serialized = Extension.serializePrimitiveExtension(self.performedString) 
        result['_performedString'] = serialized unless serialized.nil?
      end          
      unless self.performedAge.nil?
        result['performedAge'] = self.performedAge.as_json(*args)                        
      end          
      unless self.performedRange.nil?
        result['performedRange'] = self.performedRange.as_json(*args)                        
      end          
      unless self.recorder.nil? 
        result['recorder'] = self.recorder.as_json(*args)
      end
      unless self.asserter.nil? 
        result['asserter'] = self.asserter.as_json(*args)
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.bodySite.nil?  || !self.bodySite.any? 
        result['bodySite'] = self.bodySite.map{ |x| x.as_json(*args) }
      end
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.as_json(*args)
      end
      unless self.report.nil?  || !self.report.any? 
        result['report'] = self.report.map{ |x| x.as_json(*args) }
      end
      unless self.complication.nil?  || !self.complication.any? 
        result['complication'] = self.complication.map{ |x| x.as_json(*args) }
      end
      unless self.complicationDetail.nil?  || !self.complicationDetail.any? 
        result['complicationDetail'] = self.complicationDetail.map{ |x| x.as_json(*args) }
      end
      unless self.followUp.nil?  || !self.followUp.any? 
        result['followUp'] = self.followUp.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.focalDevice.nil?  || !self.focalDevice.any? 
        result['focalDevice'] = self.focalDevice.map{ |x| x.as_json(*args) }
      end
      unless self.usedReference.nil?  || !self.usedReference.any? 
        result['usedReference'] = self.usedReference.map{ |x| x.as_json(*args) }
      end
      unless self.usedCode.nil?  || !self.usedCode.any? 
        result['usedCode'] = self.usedCode.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Procedure.new)
    
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
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = ProcedureStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['performedDateTime'] = PrimitiveDateTime.transform_json(json_hash['performedDateTime'], json_hash['_performedDateTime']) unless json_hash['performedDateTime'].nil?
      result['performedPeriod'] = Period.transform_json(json_hash['performedPeriod']) unless json_hash['performedPeriod'].nil?
      result['performedString'] = PrimitiveString.transform_json(json_hash['performedString'], json_hash['_performedString']) unless json_hash['performedString'].nil?
      result['performedAge'] = Age.transform_json(json_hash['performedAge']) unless json_hash['performedAge'].nil?
      result['performedRange'] = Range.transform_json(json_hash['performedRange']) unless json_hash['performedRange'].nil?
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?
      result['asserter'] = Reference.transform_json(json_hash['asserter']) unless json_hash['asserter'].nil?
      result['performer'] = json_hash['performer'].map { |var| ProcedurePerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodySite'].nil?
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?
      result['report'] = json_hash['report'].map { |var| Reference.transform_json(var) } unless json_hash['report'].nil?
      result['complication'] = json_hash['complication'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['complication'].nil?
      result['complicationDetail'] = json_hash['complicationDetail'].map { |var| Reference.transform_json(var) } unless json_hash['complicationDetail'].nil?
      result['followUp'] = json_hash['followUp'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['followUp'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['focalDevice'] = json_hash['focalDevice'].map { |var| ProcedureFocalDevice.transform_json(var) } unless json_hash['focalDevice'].nil?
      result['usedReference'] = json_hash['usedReference'].map { |var| Reference.transform_json(var) } unless json_hash['usedReference'].nil?
      result['usedCode'] = json_hash['usedCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['usedCode'].nil?

      result
    end
  end
end
