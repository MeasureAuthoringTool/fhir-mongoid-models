module FHIR
  # fhir/goal.rb
  class Goal < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :lifecycleStatus, class_name: 'FHIR::GoalLifecycleStatus'    
    embeds_one :achievementStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :priority, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::CodeableConcept'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :startDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :startCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_many :target, class_name: 'FHIR::GoalTarget'    
    embeds_one :statusDate, class_name: 'FHIR::PrimitiveDate'    
    embeds_one :statusReason, class_name: 'FHIR::PrimitiveString'    
    embeds_one :expressedBy, class_name: 'FHIR::Reference'    
    embeds_many :addresses, class_name: 'FHIR::Reference'    
    embeds_many :note, class_name: 'FHIR::Annotation'    
    embeds_many :outcomeCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :outcomeReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.lifecycleStatus.nil? 
        result['lifecycleStatus'] = self.lifecycleStatus.value
        serialized = Extension.serializePrimitiveExtension(self.lifecycleStatus)            
        result['_lifecycleStatus'] = serialized unless serialized.nil?
      end
      unless self.achievementStatus.nil? 
        result['achievementStatus'] = self.achievementStatus.as_json(*args)
      end
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.priority.nil? 
        result['priority'] = self.priority.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.as_json(*args)
      end
      unless self.subject.nil? 
        result['subject'] = self.subject.as_json(*args)
      end
      unless self.startDate.nil?
        result['startDate'] = self.startDate.value                        
        serialized = Extension.serializePrimitiveExtension(self.startDate) 
        result['_startDate'] = serialized unless serialized.nil?
      end          
      unless self.startCodeableConcept.nil?
        result['startCodeableConcept'] = self.startCodeableConcept.as_json(*args)                        
      end          
      unless self.target.nil?  || !self.target.any? 
        result['target'] = self.target.map{ |x| x.as_json(*args) }
      end
      unless self.statusDate.nil? 
        result['statusDate'] = self.statusDate.value
        serialized = Extension.serializePrimitiveExtension(self.statusDate)            
        result['_statusDate'] = serialized unless serialized.nil?
      end
      unless self.statusReason.nil? 
        result['statusReason'] = self.statusReason.value
        serialized = Extension.serializePrimitiveExtension(self.statusReason)            
        result['_statusReason'] = serialized unless serialized.nil?
      end
      unless self.expressedBy.nil? 
        result['expressedBy'] = self.expressedBy.as_json(*args)
      end
      unless self.addresses.nil?  || !self.addresses.any? 
        result['addresses'] = self.addresses.map{ |x| x.as_json(*args) }
      end
      unless self.note.nil?  || !self.note.any? 
        result['note'] = self.note.map{ |x| x.as_json(*args) }
      end
      unless self.outcomeCode.nil?  || !self.outcomeCode.any? 
        result['outcomeCode'] = self.outcomeCode.map{ |x| x.as_json(*args) }
      end
      unless self.outcomeReference.nil?  || !self.outcomeReference.any? 
        result['outcomeReference'] = self.outcomeReference.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Goal.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['lifecycleStatus'] = GoalLifecycleStatus.transform_json(json_hash['lifecycleStatus'], json_hash['_lifecycleStatus']) unless json_hash['lifecycleStatus'].nil?
      result['achievementStatus'] = CodeableConcept.transform_json(json_hash['achievementStatus']) unless json_hash['achievementStatus'].nil?
      result['category'] = json_hash['category'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['category'].nil?
      result['priority'] = CodeableConcept.transform_json(json_hash['priority']) unless json_hash['priority'].nil?
      result['description'] = CodeableConcept.transform_json(json_hash['description']) unless json_hash['description'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['startDate'] = PrimitiveDate.transform_json(json_hash['startDate'], json_hash['_startDate']) unless json_hash['startDate'].nil?
      result['startCodeableConcept'] = CodeableConcept.transform_json(json_hash['startCodeableConcept']) unless json_hash['startCodeableConcept'].nil?
      result['target'] = json_hash['target'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          GoalTarget.transform_json(var) 
        end
      } unless json_hash['target'].nil?
      result['statusDate'] = PrimitiveDate.transform_json(json_hash['statusDate'], json_hash['_statusDate']) unless json_hash['statusDate'].nil?
      result['statusReason'] = PrimitiveString.transform_json(json_hash['statusReason'], json_hash['_statusReason']) unless json_hash['statusReason'].nil?
      result['expressedBy'] = Reference.transform_json(json_hash['expressedBy']) unless json_hash['expressedBy'].nil?
      result['addresses'] = json_hash['addresses'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['addresses'].nil?
      result['note'] = json_hash['note'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Annotation.transform_json(var) 
        end
      } unless json_hash['note'].nil?
      result['outcomeCode'] = json_hash['outcomeCode'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['outcomeCode'].nil?
      result['outcomeReference'] = json_hash['outcomeReference'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['outcomeReference'].nil?

      result
    end
  end
end
