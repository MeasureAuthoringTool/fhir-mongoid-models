module FHIR
  # fhir/medicinal_product_undesirable_effect.rb
  class MedicinalProductUndesirableEffect < DomainResource
    include Mongoid::Document
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_one :symptomConditionEffect, class_name: 'FHIR::CodeableConcept'    
    embeds_one :classification, class_name: 'FHIR::CodeableConcept'    
    embeds_one :frequencyOfOccurrence, class_name: 'FHIR::CodeableConcept'    
    embeds_many :population, class_name: 'FHIR::Population'    
    
    def as_json(*args)
      result = super      
      unless self.subject.nil?  || !self.subject.any? 
        result['subject'] = self.subject.map{ |x| x.as_json(*args) }
      end
      unless self.symptomConditionEffect.nil? 
        result['symptomConditionEffect'] = self.symptomConditionEffect.as_json(*args)
      end
      unless self.classification.nil? 
        result['classification'] = self.classification.as_json(*args)
      end
      unless self.frequencyOfOccurrence.nil? 
        result['frequencyOfOccurrence'] = self.frequencyOfOccurrence.as_json(*args)
      end
      unless self.population.nil?  || !self.population.any? 
        result['population'] = self.population.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductUndesirableEffect.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['symptomConditionEffect'] = CodeableConcept.transform_json(json_hash['symptomConditionEffect']) unless json_hash['symptomConditionEffect'].nil?
      result['classification'] = CodeableConcept.transform_json(json_hash['classification']) unless json_hash['classification'].nil?
      result['frequencyOfOccurrence'] = CodeableConcept.transform_json(json_hash['frequencyOfOccurrence']) unless json_hash['frequencyOfOccurrence'].nil?
      result['population'] = json_hash['population'].map { |var| Population.transform_json(var) } unless json_hash['population'].nil?

      result
    end
  end
end
