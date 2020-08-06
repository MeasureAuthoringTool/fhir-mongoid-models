module FHIR
  # fhir/risk_assessment.rb
  class RiskAssessment < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :basedOn, class_name: 'FHIR::Reference'    
    embeds_one :parent, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::RiskAssessmentStatus'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :occurrenceDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :occurrencePeriod, class_name: 'FHIR::Period'    
    embeds_one :condition, class_name: 'FHIR::Reference'    
    embeds_one :performer, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :basis, class_name: 'FHIR::Reference'    
    embeds_many :prediction, class_name: 'FHIR::RiskAssessmentPrediction'    
    embeds_one :mitigation, class_name: 'FHIR::PrimitiveString'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.basedOn.nil? 
        result['basedOn'] = self.basedOn.as_json(*args)
      end
      unless self.parent.nil? 
        result['parent'] = self.parent.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
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
      unless self.occurrenceDateTime.nil?
        result['occurrenceDateTime'] = self.occurrenceDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.occurrenceDateTime) 
        result['_occurrenceDateTime'] = serialized unless serialized.nil?
      end          
      unless self.occurrencePeriod.nil?
        result['occurrencePeriod'] = self.occurrencePeriod.as_json(*args)                        
      end          
      unless self.condition.nil? 
        result['condition'] = self.condition.as_json(*args)
      end
      unless self.performer.nil? 
        result['performer'] = self.performer.as_json(*args)
      end
      unless self.reasonCode.nil?  || !self.reasonCode.any? 
        result['reasonCode'] = self.reasonCode.map{ |x| x.as_json(*args) }
      end
      unless self.reasonReference.nil?  || !self.reasonReference.any? 
        result['reasonReference'] = self.reasonReference.map{ |x| x.as_json(*args) }
      end
      unless self.basis.nil?  || !self.basis.any? 
        result['basis'] = self.basis.map{ |x| x.as_json(*args) }
      end
      unless self.prediction.nil?  || !self.prediction.any? 
        result['prediction'] = self.prediction.map{ |x| x.as_json(*args) }
      end
      unless self.mitigation.nil? 
        result['mitigation'] = self.mitigation.value
        serialized = Extension.serializePrimitiveExtension(self.mitigation)            
        result['_mitigation'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = RiskAssessment.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['basedOn'] = Reference.transform_json(json_hash['basedOn']) unless json_hash['basedOn'].nil?
      result['parent'] = Reference.transform_json(json_hash['parent']) unless json_hash['parent'].nil?
      result['status'] = RiskAssessmentStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?
      result['condition'] = Reference.transform_json(json_hash['condition']) unless json_hash['condition'].nil?
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?
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
      result['basis'] = json_hash['basis'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['basis'].nil?
      result['prediction'] = json_hash['prediction'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          RiskAssessmentPrediction.transform_json(var) 
        end
      } unless json_hash['prediction'].nil?
      result['mitigation'] = PrimitiveString.transform_json(json_hash['mitigation'], json_hash['_mitigation']) unless json_hash['mitigation'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?

      result
    end
  end
end
