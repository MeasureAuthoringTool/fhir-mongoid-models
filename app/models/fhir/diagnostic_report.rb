module FHIR
  # fhir/diagnostic_report.rb
  class DiagnosticReport < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::DiagnosticReportStatus'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :effectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :issued, class_name: 'FHIR::PrimitiveInstant'    
    embeds_many :performer, class_name: 'FHIR::Reference'    
    embeds_many :resultsInterpreter, class_name: 'FHIR::Reference'    
    embeds_many :specimen, class_name: 'FHIR::Reference'    
    embeds_many :result, class_name: 'FHIR::Reference'    
    embeds_many :imagingStudy, class_name: 'FHIR::Reference'    
    embeds_many :media, class_name: 'FHIR::DiagnosticReportMedia'    
    embeds_one :conclusion, class_name: 'FHIR::PrimitiveString'    
    embeds_many :conclusionCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :presentedForm, class_name: 'FHIR::Attachment'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.basedOn.nil?  || !self.basedOn.any? 
        result['basedOn'] = self.basedOn.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
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
      unless self.effectiveDateTime.nil?
        result['effectiveDateTime'] = self.effectiveDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.effectiveDateTime) 
        result['_effectiveDateTime'] = serialized unless serialized.nil?
      end          
      unless self.effectivePeriod.nil?
        result['effectivePeriod'] = self.effectivePeriod.as_json(*args)                        
      end          
      unless self.issued.nil? 
        result['issued'] = self.issued.value
        serialized = Extension.serializePrimitiveExtension(self.issued)            
        result['_issued'] = serialized unless serialized.nil?
      end
      unless self.performer.nil?  || !self.performer.any? 
        result['performer'] = self.performer.map{ |x| x.as_json(*args) }
      end
      unless self.resultsInterpreter.nil?  || !self.resultsInterpreter.any? 
        result['resultsInterpreter'] = self.resultsInterpreter.map{ |x| x.as_json(*args) }
      end
      unless self.specimen.nil?  || !self.specimen.any? 
        result['specimen'] = self.specimen.map{ |x| x.as_json(*args) }
      end
      unless self.result.nil?  || !self.result.any? 
        result['result'] = self.result.map{ |x| x.as_json(*args) }
      end
      unless self.imagingStudy.nil?  || !self.imagingStudy.any? 
        result['imagingStudy'] = self.imagingStudy.map{ |x| x.as_json(*args) }
      end
      unless self.media.nil?  || !self.media.any? 
        result['media'] = self.media.map{ |x| x.as_json(*args) }
      end
      unless self.conclusion.nil? 
        result['conclusion'] = self.conclusion.value
        serialized = Extension.serializePrimitiveExtension(self.conclusion)            
        result['_conclusion'] = serialized unless serialized.nil?
      end
      unless self.conclusionCode.nil?  || !self.conclusionCode.any? 
        result['conclusionCode'] = self.conclusionCode.map{ |x| x.as_json(*args) }
      end
      unless self.presentedForm.nil?  || !self.presentedForm.any? 
        result['presentedForm'] = self.presentedForm.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DiagnosticReport.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['status'] = DiagnosticReportStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['issued'] = PrimitiveInstant.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
      result['resultsInterpreter'] = json_hash['resultsInterpreter'].map { |var| Reference.transform_json(var) } unless json_hash['resultsInterpreter'].nil?
      result['specimen'] = json_hash['specimen'].map { |var| Reference.transform_json(var) } unless json_hash['specimen'].nil?
      result['result'] = json_hash['result'].map { |var| Reference.transform_json(var) } unless json_hash['result'].nil?
      result['imagingStudy'] = json_hash['imagingStudy'].map { |var| Reference.transform_json(var) } unless json_hash['imagingStudy'].nil?
      result['media'] = json_hash['media'].map { |var| DiagnosticReportMedia.transform_json(var) } unless json_hash['media'].nil?
      result['conclusion'] = PrimitiveString.transform_json(json_hash['conclusion'], json_hash['_conclusion']) unless json_hash['conclusion'].nil?
      result['conclusionCode'] = json_hash['conclusionCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['conclusionCode'].nil?
      result['presentedForm'] = json_hash['presentedForm'].map { |var| Attachment.transform_json(var) } unless json_hash['presentedForm'].nil?

      result
    end
  end
end
