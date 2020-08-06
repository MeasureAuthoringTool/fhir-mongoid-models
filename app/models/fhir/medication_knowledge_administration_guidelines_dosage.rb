module FHIR
  # fhir/medication_knowledge_administration_guidelines_dosage.rb
  class MedicationKnowledgeAdministrationGuidelinesDosage < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :dosage, class_name: 'FHIR::Dosage'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.dosage.nil?  || !self.dosage.any? 
        result['dosage'] = self.dosage.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeAdministrationGuidelinesDosage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['dosage'] = json_hash['dosage'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Dosage.transform_json(var) 
        end
      } unless json_hash['dosage'].nil?

      result
    end
  end
end
