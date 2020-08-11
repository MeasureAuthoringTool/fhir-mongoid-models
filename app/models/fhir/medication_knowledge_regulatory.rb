module FHIR
  # fhir/medication_knowledge_regulatory.rb
  class MedicationKnowledgeRegulatory < BackboneElement
    include Mongoid::Document
    embeds_one :regulatoryAuthority, class_name: 'FHIR::Reference'    
    embeds_many :substitution, class_name: 'FHIR::MedicationKnowledgeRegulatorySubstitution'    
    embeds_many :schedule, class_name: 'FHIR::MedicationKnowledgeRegulatorySchedule'    
    embeds_one :maxDispense, class_name: 'FHIR::MedicationKnowledgeRegulatoryMaxDispense'    
    
    def as_json(*args)
      result = super      
      unless self.regulatoryAuthority.nil? 
        result['regulatoryAuthority'] = self.regulatoryAuthority.as_json(*args)
      end
      unless self.substitution.nil?  || !self.substitution.any? 
        result['substitution'] = self.substitution.map{ |x| x.as_json(*args) }
      end
      unless self.schedule.nil?  || !self.schedule.any? 
        result['schedule'] = self.schedule.map{ |x| x.as_json(*args) }
      end
      unless self.maxDispense.nil? 
        result['maxDispense'] = self.maxDispense.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeRegulatory.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['regulatoryAuthority'] = Reference.transform_json(json_hash['regulatoryAuthority']) unless json_hash['regulatoryAuthority'].nil?
      result['substitution'] = json_hash['substitution'].map { |var| MedicationKnowledgeRegulatorySubstitution.transform_json(var) } unless json_hash['substitution'].nil?
      result['schedule'] = json_hash['schedule'].map { |var| MedicationKnowledgeRegulatorySchedule.transform_json(var) } unless json_hash['schedule'].nil?
      result['maxDispense'] = MedicationKnowledgeRegulatoryMaxDispense.transform_json(json_hash['maxDispense']) unless json_hash['maxDispense'].nil?

      result
    end
  end
end
