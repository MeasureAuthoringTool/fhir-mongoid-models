module FHIR
  # fhir/research_study.rb
  class ResearchStudy < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_many :protocol, class_name: 'FHIR::Reference'    
    embeds_many :partOf, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::ResearchStudyStatus'    
    embeds_one :primaryPurposeType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :phase, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_many :focus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :condition, class_name: 'FHIR::CodeableConcept'    
    embeds_many :contact, class_name: 'FHIR::ContactDetail'    
    embeds_many :relatedArtifact, class_name: 'FHIR::RelatedArtifact'    
    embeds_many :keyword, class_name: 'FHIR::CodeableConcept'    
    embeds_many :location, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :enrollment, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :sponsor, class_name: 'FHIR::Reference'    
    embeds_one :principalInvestigator, class_name: 'FHIR::Reference'    
    embeds_many :site, class_name: 'FHIR::Reference'    
    embeds_one :reasonStopped, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :arm, class_name: 'FHIR::ResearchStudyArm'    
    embeds_many :objective, class_name: 'FHIR::ResearchStudyObjective'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.protocol.nil?  || !self.protocol.any? 
        result['protocol'] = self.protocol.map{ |x| x.as_json(*args) }
      end
      unless self.partOf.nil?  || !self.partOf.any? 
        result['partOf'] = self.partOf.map{ |x| x.as_json(*args) }
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.primaryPurposeType.nil? 
        result['primaryPurposeType'] = self.primaryPurposeType.as_json(*args)
      end
      unless self.phase.nil? 
        result['phase'] = self.phase.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.focus.nil?  || !self.focus.any? 
        result['focus'] = self.focus.map{ |x| x.as_json(*args) }
      end
      unless self.condition.nil?  || !self.condition.any? 
        result['condition'] = self.condition.map{ |x| x.as_json(*args) }
      end
      unless self.contact.nil?  || !self.contact.any? 
        result['contact'] = self.contact.map{ |x| x.as_json(*args) }
      end
      unless self.relatedArtifact.nil?  || !self.relatedArtifact.any? 
        result['relatedArtifact'] = self.relatedArtifact.map{ |x| x.as_json(*args) }
      end
      unless self.keyword.nil?  || !self.keyword.any? 
        result['keyword'] = self.keyword.map{ |x| x.as_json(*args) }
      end
      unless self.location.nil?  || !self.location.any? 
        result['location'] = self.location.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.enrollment.nil?  || !self.enrollment.any? 
        result['enrollment'] = self.enrollment.map{ |x| x.as_json(*args) }
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.sponsor.nil? 
        result['sponsor'] = self.sponsor.as_json(*args)
      end
      unless self.principalInvestigator.nil? 
        result['principalInvestigator'] = self.principalInvestigator.as_json(*args)
      end
      unless self.site.nil?  || !self.site.any? 
        result['site'] = self.site.map{ |x| x.as_json(*args) }
      end
      unless self.reasonStopped.nil? 
        result['reasonStopped'] = self.reasonStopped.as_json(*args)
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.arm.nil?  || !self.arm.any? 
        result['arm'] = self.arm.map{ |x| x.as_json(*args) }
      end
      unless self.objective.nil?  || !self.objective.any? 
        result['objective'] = self.objective.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ResearchStudy.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['protocol'] = json_hash['protocol'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['protocol'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['partOf'].nil?
      result['status'] = ResearchStudyStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['primaryPurposeType'] = CodeableConcept.transform_json(json_hash['primaryPurposeType']) unless json_hash['primaryPurposeType'].nil?
      result['phase'] = CodeableConcept.transform_json(json_hash['phase']) unless json_hash['phase'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['focus'] = json_hash['focus'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['focus'].nil?
      result['condition'] = json_hash['condition'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['condition'].nil?
      result['contact'] = json_hash['contact'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ContactDetail.transform_json(var) 
        end
      } unless json_hash['contact'].nil?
      result['relatedArtifact'] = json_hash['relatedArtifact'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          RelatedArtifact.transform_json(var) 
        end
      } unless json_hash['relatedArtifact'].nil?
      result['keyword'] = json_hash['keyword'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['keyword'].nil?
      result['location'] = json_hash['location'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['location'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['enrollment'] = json_hash['enrollment'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['enrollment'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['sponsor'] = Reference.transform_json(json_hash['sponsor']) unless json_hash['sponsor'].nil?
      result['principalInvestigator'] = Reference.transform_json(json_hash['principalInvestigator']) unless json_hash['principalInvestigator'].nil?
      result['site'] = json_hash['site'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['site'].nil?
      result['reasonStopped'] = CodeableConcept.transform_json(json_hash['reasonStopped']) unless json_hash['reasonStopped'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['arm'] = json_hash['arm'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ResearchStudyArm.transform_json(var) 
        end
      } unless json_hash['arm'].nil?
      result['objective'] = json_hash['objective'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ResearchStudyObjective.transform_json(var) 
        end
      } unless json_hash['objective'].nil?

      result
    end
  end
end
