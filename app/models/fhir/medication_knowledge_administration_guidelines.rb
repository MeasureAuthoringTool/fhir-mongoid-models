module FHIR
  # fhir/medication_knowledge_administration_guidelines.rb
  class MedicationKnowledgeAdministrationGuidelines < BackboneElement
    include Mongoid::Document
    embeds_many :dosage, class_name: 'FHIR::MedicationKnowledgeAdministrationGuidelinesDosage'    
    embeds_one :indicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :indicationReference, class_name: 'FHIR::Reference'    
    embeds_many :patientCharacteristics, class_name: 'FHIR::MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics'    
    
    def as_json(*args)
      result = super      
      unless self.dosage.nil?  || !self.dosage.any? 
        result['dosage'] = self.dosage.map{ |x| x.as_json(*args) }
      end
      unless self.indicationCodeableConcept.nil?
        result['indicationCodeableConcept'] = self.indicationCodeableConcept.as_json(*args)                        
      end          
      unless self.indicationReference.nil?
        result['indicationReference'] = self.indicationReference.as_json(*args)                        
      end          
      unless self.patientCharacteristics.nil?  || !self.patientCharacteristics.any? 
        result['patientCharacteristics'] = self.patientCharacteristics.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeAdministrationGuidelines.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['dosage'] = json_hash['dosage'].map { |var| MedicationKnowledgeAdministrationGuidelinesDosage.transform_json(var) } unless json_hash['dosage'].nil?
      result['indicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['indicationCodeableConcept']) unless json_hash['indicationCodeableConcept'].nil?
      result['indicationReference'] = Reference.transform_json(json_hash['indicationReference']) unless json_hash['indicationReference'].nil?
      result['patientCharacteristics'] = json_hash['patientCharacteristics'].map { |var| MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics.transform_json(var) } unless json_hash['patientCharacteristics'].nil?

      result
    end
  end
end
