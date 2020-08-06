module FHIR
  # fhir/detected_issue.rb
  class DetectedIssue < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::DetectedIssueStatus'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :severity, class_name: 'FHIR::DetectedIssueSeverity'    
    embeds_one :patient, class_name: 'FHIR::Reference'    
    embeds_one :identifiedDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :identifiedPeriod, class_name: 'FHIR::Period'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_many :implicated, class_name: 'FHIR::Reference'    
    embeds_many :evidence, class_name: 'FHIR::DetectedIssueEvidence'    
    embeds_one :detail, class_name: 'FHIR::PrimitiveString'    
    embeds_one :reference, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :mitigation, class_name: 'FHIR::DetectedIssueMitigation'    
    
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
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.severity.nil? 
        result['severity'] = self.severity.value
        serialized = Extension.serializePrimitiveExtension(self.severity)            
        result['_severity'] = serialized unless serialized.nil?
      end
      unless self.patient.nil? 
        result['patient'] = self.patient.as_json(*args)
      end
      unless self.identifiedDateTime.nil?
        result['identifiedDateTime'] = self.identifiedDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.identifiedDateTime) 
        result['_identifiedDateTime'] = serialized unless serialized.nil?
      end          
      unless self.identifiedPeriod.nil?
        result['identifiedPeriod'] = self.identifiedPeriod.as_json(*args)                        
      end          
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      unless self.implicated.nil?  || !self.implicated.any? 
        result['implicated'] = self.implicated.map{ |x| x.as_json(*args) }
      end
      unless self.evidence.nil?  || !self.evidence.any? 
        result['evidence'] = self.evidence.map{ |x| x.as_json(*args) }
      end
      unless self.detail.nil? 
        result['detail'] = self.detail.value
        serialized = Extension.serializePrimitiveExtension(self.detail)            
        result['_detail'] = serialized unless serialized.nil?
      end
      unless self.reference.nil? 
        result['reference'] = self.reference.value
        serialized = Extension.serializePrimitiveExtension(self.reference)            
        result['_reference'] = serialized unless serialized.nil?
      end
      unless self.mitigation.nil?  || !self.mitigation.any? 
        result['mitigation'] = self.mitigation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = DetectedIssue.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['status'] = DetectedIssueStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['severity'] = DetectedIssueSeverity.transform_json(json_hash['severity'], json_hash['_severity']) unless json_hash['severity'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?
      result['identifiedDateTime'] = PrimitiveDateTime.transform_json(json_hash['identifiedDateTime'], json_hash['_identifiedDateTime']) unless json_hash['identifiedDateTime'].nil?
      result['identifiedPeriod'] = Period.transform_json(json_hash['identifiedPeriod']) unless json_hash['identifiedPeriod'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['implicated'] = json_hash['implicated'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['implicated'].nil?
      result['evidence'] = json_hash['evidence'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DetectedIssueEvidence.transform_json(var) 
        end
      } unless json_hash['evidence'].nil?
      result['detail'] = PrimitiveString.transform_json(json_hash['detail'], json_hash['_detail']) unless json_hash['detail'].nil?
      result['reference'] = PrimitiveUri.transform_json(json_hash['reference'], json_hash['_reference']) unless json_hash['reference'].nil?
      result['mitigation'] = json_hash['mitigation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          DetectedIssueMitigation.transform_json(var) 
        end
      } unless json_hash['mitigation'].nil?

      result
    end
  end
end
