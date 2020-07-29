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

    def self.transform_json(json_hash, target = ResearchSubject.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ResearchSubjectStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
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
