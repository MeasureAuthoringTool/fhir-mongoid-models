module FHIR
  # fhir/research_subject.rb
  class ResearchSubject < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::ResearchSubjectStatus'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :study, class_name: 'FHIR::Reference'    
    embeds_one :individual, class_name: 'FHIR::Reference'    
    embeds_one :assignedArm, class_name: 'FHIR::PrimitiveString'    
    embeds_one :actualArm, class_name: 'FHIR::PrimitiveString'    
    embeds_one :consent, class_name: 'FHIR::Reference'    
    
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
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.study.nil? 
        result['study'] = self.study.as_json(*args)
      end
      unless self.individual.nil? 
        result['individual'] = self.individual.as_json(*args)
      end
      unless self.assignedArm.nil? 
        result['assignedArm'] = self.assignedArm.value
        serialized = Extension.serializePrimitiveExtension(self.assignedArm)            
        result['_assignedArm'] = serialized unless serialized.nil?
      end
      unless self.actualArm.nil? 
        result['actualArm'] = self.actualArm.value
        serialized = Extension.serializePrimitiveExtension(self.actualArm)            
        result['_actualArm'] = serialized unless serialized.nil?
      end
      unless self.consent.nil? 
        result['consent'] = self.consent.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ResearchSubject.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ResearchSubjectStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['study'] = Reference.transform_json(json_hash['study']) unless json_hash['study'].nil?
      result['individual'] = Reference.transform_json(json_hash['individual']) unless json_hash['individual'].nil?
      result['assignedArm'] = PrimitiveString.transform_json(json_hash['assignedArm'], json_hash['_assignedArm']) unless json_hash['assignedArm'].nil?
      result['actualArm'] = PrimitiveString.transform_json(json_hash['actualArm'], json_hash['_actualArm']) unless json_hash['actualArm'].nil?
      result['consent'] = Reference.transform_json(json_hash['consent']) unless json_hash['consent'].nil?

      result
    end
  end
end
