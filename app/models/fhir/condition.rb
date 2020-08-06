module FHIR
  # fhir/condition.rb
  class Condition < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :clinicalStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :verificationStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :severity, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :onsetDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :onsetAge, class_name: 'FHIR::Age'    
    embeds_one :onsetPeriod, class_name: 'FHIR::Period'    
    embeds_one :onsetRange, class_name: 'FHIR::Range'    
    embeds_one :onsetString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :abatementDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :abatementAge, class_name: 'FHIR::Age'    
    embeds_one :abatementPeriod, class_name: 'FHIR::Period'    
    embeds_one :abatementRange, class_name: 'FHIR::Range'    
    embeds_one :abatementString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :recordedDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :recorder, class_name: 'FHIR::Reference'    
    embeds_one :asserter, class_name: 'FHIR::Reference'    
    embeds_many :stage, class_name: 'FHIR::ConditionStage'    
    embeds_many :evidence, class_name: 'FHIR::ConditionEvidence'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.clinicalStatus.nil? 
        result['clinicalStatus'] = self.clinicalStatus.as_json(*args)
      end
      unless self.verificationStatus.nil? 
        result['verificationStatus'] = self.verificationStatus.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.severity.nil? 
        result['severity'] = self.severity.as_json(*args)
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.bodySite.nil?  || !self.bodySite.any? 
        result['bodySite'] = self.bodySite.map{ |x| x.as_json(*args) }
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.onsetDateTime.nil?
        result['onsetDateTime'] = self.onsetDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.onsetDateTime) 
        result['_onsetDateTime'] = serialized unless serialized.nil?
      end          
      unless self.onsetAge.nil?
        result['onsetAge'] = self.onsetAge.as_json(*args)                        
      end          
      unless self.onsetPeriod.nil?
        result['onsetPeriod'] = self.onsetPeriod.as_json(*args)                        
      end          
      unless self.onsetRange.nil?
        result['onsetRange'] = self.onsetRange.as_json(*args)                        
      end          
      unless self.onsetString.nil?
        result['onsetString'] = self.onsetString.value                        
        serialized = Extension.serializePrimitiveExtension(self.onsetString) 
        result['_onsetString'] = serialized unless serialized.nil?
      end          
      unless self.abatementDateTime.nil?
        result['abatementDateTime'] = self.abatementDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.abatementDateTime) 
        result['_abatementDateTime'] = serialized unless serialized.nil?
      end          
      unless self.abatementAge.nil?
        result['abatementAge'] = self.abatementAge.as_json(*args)                        
      end          
      unless self.abatementPeriod.nil?
        result['abatementPeriod'] = self.abatementPeriod.as_json(*args)                        
      end          
      unless self.abatementRange.nil?
        result['abatementRange'] = self.abatementRange.as_json(*args)                        
      end          
      unless self.abatementString.nil?
        result['abatementString'] = self.abatementString.value                        
        serialized = Extension.serializePrimitiveExtension(self.abatementString) 
        result['_abatementString'] = serialized unless serialized.nil?
      end          
      unless self.recordedDate.nil? 
        result['recordedDate'] = self.recordedDate.value
        serialized = Extension.serializePrimitiveExtension(self.recordedDate)            
        result['_recordedDate'] = serialized unless serialized.nil?
      end
      unless self.recorder.nil? 
        result['recorder'] = self.recorder.as_json(*args)
      end
      unless self.asserter.nil? 
        result['asserter'] = self.asserter.as_json(*args)
      end
      unless self.stage.nil?  || !self.stage.any? 
        result['stage'] = self.stage.map{ |x| x.as_json(*args) }
      end
      unless self.evidence.nil?  || !self.evidence.any? 
        result['evidence'] = self.evidence.map{ |x| x.as_json(*args) }
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

    def self.transform_json(json_hash, target = Condition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['clinicalStatus'] = CodeableConcept.transform_json(json_hash['clinicalStatus']) unless json_hash['clinicalStatus'].nil?
      result['verificationStatus'] = CodeableConcept.transform_json(json_hash['verificationStatus']) unless json_hash['verificationStatus'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['severity'] = CodeableConcept.transform_json(json_hash['severity']) unless json_hash['severity'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['bodySite'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['onsetDateTime'] = PrimitiveDateTime.transform_json(json_hash['onsetDateTime'], json_hash['_onsetDateTime']) unless json_hash['onsetDateTime'].nil?
      result['onsetAge'] = Age.transform_json(json_hash['onsetAge']) unless json_hash['onsetAge'].nil?
      result['onsetPeriod'] = Period.transform_json(json_hash['onsetPeriod']) unless json_hash['onsetPeriod'].nil?
      result['onsetRange'] = Range.transform_json(json_hash['onsetRange']) unless json_hash['onsetRange'].nil?
      result['onsetString'] = PrimitiveString.transform_json(json_hash['onsetString'], json_hash['_onsetString']) unless json_hash['onsetString'].nil?
      result['abatementDateTime'] = PrimitiveDateTime.transform_json(json_hash['abatementDateTime'], json_hash['_abatementDateTime']) unless json_hash['abatementDateTime'].nil?
      result['abatementAge'] = Age.transform_json(json_hash['abatementAge']) unless json_hash['abatementAge'].nil?
      result['abatementPeriod'] = Period.transform_json(json_hash['abatementPeriod']) unless json_hash['abatementPeriod'].nil?
      result['abatementRange'] = Range.transform_json(json_hash['abatementRange']) unless json_hash['abatementRange'].nil?
      result['abatementString'] = PrimitiveString.transform_json(json_hash['abatementString'], json_hash['_abatementString']) unless json_hash['abatementString'].nil?
      result['recordedDate'] = PrimitiveDateTime.transform_json(json_hash['recordedDate'], json_hash['_recordedDate']) unless json_hash['recordedDate'].nil?
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?
      result['asserter'] = Reference.transform_json(json_hash['asserter']) unless json_hash['asserter'].nil?
      result['stage'] = json_hash['stage'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ConditionStage.transform_json(var) 
        end
      } unless json_hash['stage'].nil?
      result['evidence'] = json_hash['evidence'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ConditionEvidence.transform_json(var) 
        end
      } unless json_hash['evidence'].nil?
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
