module FHIR
  # fhir/adverse_event.rb
  class AdverseEvent < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :actuality, class_name: 'FHIR::AdverseEventActuality'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :event, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :detected, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :recordedDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :resultingCondition, class_name: 'FHIR::Reference'    
    embeds_one :location, class_name: 'FHIR::Reference'    
    embeds_one :seriousness, class_name: 'FHIR::CodeableConcept'    
    embeds_one :severity, class_name: 'FHIR::CodeableConcept'    
    embeds_one :outcome, class_name: 'FHIR::CodeableConcept'    
    embeds_one :recorder, class_name: 'FHIR::Reference'    
    embeds_many :contributor, class_name: 'FHIR::Reference'    
    embeds_many :suspectEntity, class_name: 'FHIR::AdverseEventSuspectEntity'    
    embeds_many :subjectMedicalHistory, class_name: 'FHIR::Reference'    
    embeds_many :referenceDocument, class_name: 'FHIR::Reference'    
    embeds_many :study, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.actuality.nil? 
        result['actuality'] = self.actuality.value
        serialized = Extension.serializePrimitiveExtension(self.actuality)            
        result['_actuality'] = serialized unless serialized.nil?
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.event.nil? 
        result['event'] = self.event.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.encounter.nil? 
        result['encounter'] = self.encounter.as_json(*args)
      end
      unless self.date.nil? 
        result['date'] = self.date.value
        serialized = Extension.serializePrimitiveExtension(self.date)            
        result['_date'] = serialized unless serialized.nil?
      end
      unless self.detected.nil? 
        result['detected'] = self.detected.value
        serialized = Extension.serializePrimitiveExtension(self.detected)            
        result['_detected'] = serialized unless serialized.nil?
      end
      unless self.recordedDate.nil? 
        result['recordedDate'] = self.recordedDate.value
        serialized = Extension.serializePrimitiveExtension(self.recordedDate)            
        result['_recordedDate'] = serialized unless serialized.nil?
      end
      unless self.resultingCondition.nil?  || !self.resultingCondition.any? 
        result['resultingCondition'] = self.resultingCondition.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil? 
        result['location'] = self.location.as_json(*args)
      end
      unless self.seriousness.nil? 
        result['seriousness'] = self.seriousness.as_json(*args)
      end
      unless self.severity.nil? 
        result['severity'] = self.severity.as_json(*args)
      end
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.as_json(*args)
      end
      unless self.recorder.nil? 
        result['recorder'] = self.recorder.as_json(*args)
      end
      unless self.contributor.nil?  || !self.contributor.any? 
        result['contributor'] = self.contributor.map{ |x| x.as_json(*args) }
      end
      unless self.suspectEntity.nil?  || !self.suspectEntity.any? 
        result['suspectEntity'] = self.suspectEntity.map{ |x| x.as_json(*args) }
      end
      unless self.subjectMedicalHistory.nil?  || !self.subjectMedicalHistory.any? 
        result['subjectMedicalHistory'] = self.subjectMedicalHistory.map{ |x| x.as_json(*args) }
      end
      unless self.referenceDocument.nil?  || !self.referenceDocument.any? 
        result['referenceDocument'] = self.referenceDocument.map{ |x| x.as_json(*args) }
      end
      unless self.study.nil?  || !self.study.any? 
        result['study'] = self.study.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AdverseEvent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['actuality'] = AdverseEventActuality.transform_json(json_hash['actuality'], json_hash['_actuality']) unless json_hash['actuality'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['event'] = CodeableConcept.transform_json(json_hash['event']) unless json_hash['event'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?
      result['detected'] = PrimitiveDateTime.transform_json(json_hash['detected'], json_hash['_detected']) unless json_hash['detected'].nil?
      result['recordedDate'] = PrimitiveDateTime.transform_json(json_hash['recordedDate'], json_hash['_recordedDate']) unless json_hash['recordedDate'].nil?
      result['resultingCondition'] = json_hash['resultingCondition'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['resultingCondition'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?
      result['seriousness'] = CodeableConcept.transform_json(json_hash['seriousness']) unless json_hash['seriousness'].nil?
      result['severity'] = CodeableConcept.transform_json(json_hash['severity']) unless json_hash['severity'].nil?
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?
      result['contributor'] = json_hash['contributor'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['contributor'].nil?
      result['suspectEntity'] = json_hash['suspectEntity'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          AdverseEventSuspectEntity.transform_json(var) 
        end
      } unless json_hash['suspectEntity'].nil?
      result['subjectMedicalHistory'] = json_hash['subjectMedicalHistory'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['subjectMedicalHistory'].nil?
      result['referenceDocument'] = json_hash['referenceDocument'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['referenceDocument'].nil?
      result['study'] = json_hash['study'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['study'].nil?

      result
    end
  end
end
