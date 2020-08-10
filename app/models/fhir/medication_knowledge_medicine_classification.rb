module FHIR
  # fhir/medication_knowledge_medicine_classification.rb
  class MedicationKnowledgeMedicineClassification < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :classification, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.classification.nil?  || !self.classification.any? 
        result['classification'] = self.classification.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeMedicineClassification.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['classification'] = json_hash['classification'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['classification'].nil?

      result
    end
  end
end
