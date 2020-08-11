module FHIR
  # fhir/clinical_impression.rb
  class ClinicalImpression < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ClinicalImpressionStatus'    
    embeds_one :statusReason, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :effectiveDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :effectivePeriod, class_name: 'FHIR::Period'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :assessor, class_name: 'FHIR::Reference'    
    embeds_one :previous, class_name: 'FHIR::Reference'    
    embeds_many :problem, class_name: 'FHIR::Reference'    
    embeds_many :investigation, class_name: 'FHIR::ClinicalImpressionInvestigation'    
    embeds_many :protocol, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :summary, class_name: 'FHIR::PrimitiveString'    
    embeds_many :finding, class_name: 'FHIR::ClinicalImpressionFinding'    
    embeds_many :prognosisCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_many :prognosisReference, class_name: 'FHIR::Reference'    
    embeds_many :supportingInfo, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
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
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
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
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.assessor.nil? 
        result['assessor'] = self.assessor.as_json(*args)
      end
      unless self.previous.nil? 
        result['previous'] = self.previous.as_json(*args)
      end
      unless self.problem.nil?  || !self.problem.any? 
        result['problem'] = self.problem.map{ |x| x.as_json(*args) }
      end
      unless self.investigation.nil?  || !self.investigation.any? 
        result['investigation'] = self.investigation.map{ |x| x.as_json(*args) }
      end
      unless self.protocol.nil?  || !self.protocol.any? 
        result['protocol'] = self.protocol.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.protocol)                              
        result['_protocol'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.summary.nil? 
        result['summary'] = self.summary.value
        serialized = Extension.serializePrimitiveExtension(self.summary)            
        result['_summary'] = serialized unless serialized.nil?
      end
      unless self.finding.nil?  || !self.finding.any? 
        result['finding'] = self.finding.map{ |x| x.as_json(*args) }
      end
      unless self.prognosisCodeableConcept.nil?  || !self.prognosisCodeableConcept.any? 
        result['prognosisCodeableConcept'] = self.prognosisCodeableConcept.map{ |x| x.as_json(*args) }
      end
      unless self.prognosisReference.nil?  || !self.prognosisReference.any? 
        result['prognosisReference'] = self.prognosisReference.map{ |x| x.as_json(*args) }
      end
      unless self.supportingInfo.nil?  || !self.supportingInfo.any? 
        result['supportingInfo'] = self.supportingInfo.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClinicalImpression.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ClinicalImpressionStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['effectiveDateTime'] = PrimitiveDateTime.transform_json(json_hash['effectiveDateTime'], json_hash['_effectiveDateTime']) unless json_hash['effectiveDateTime'].nil?
      result['effectivePeriod'] = Period.transform_json(json_hash['effectivePeriod']) unless json_hash['effectivePeriod'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['assessor'] = Reference.transform_json(json_hash['assessor']) unless json_hash['assessor'].nil?
      result['previous'] = Reference.transform_json(json_hash['previous']) unless json_hash['previous'].nil?
      result['problem'] = json_hash['problem'].map { |var| Reference.transform_json(var) } unless json_hash['problem'].nil?
      result['investigation'] = json_hash['investigation'].map { |var| ClinicalImpressionInvestigation.transform_json(var) } unless json_hash['investigation'].nil?
      result['protocol'] = json_hash['protocol'].each_with_index.map do |var, i|
        extension_hash = json_hash['_protocol'] && json_hash['_protocol'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['protocol'].nil?
      result['summary'] = PrimitiveString.transform_json(json_hash['summary'], json_hash['_summary']) unless json_hash['summary'].nil?
      result['finding'] = json_hash['finding'].map { |var| ClinicalImpressionFinding.transform_json(var) } unless json_hash['finding'].nil?
      result['prognosisCodeableConcept'] = json_hash['prognosisCodeableConcept'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['prognosisCodeableConcept'].nil?
      result['prognosisReference'] = json_hash['prognosisReference'].map { |var| Reference.transform_json(var) } unless json_hash['prognosisReference'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
