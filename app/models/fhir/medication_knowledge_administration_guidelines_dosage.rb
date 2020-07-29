module FHIR
  # fhir/medication_knowledge_administration_guidelines_dosage.rb
  class MedicationKnowledgeAdministrationGuidelinesDosage < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :dosage, class_name: 'FHIR::Dosage'    

    def self.transform_json(json_hash, target = MedicationKnowledgeAdministrationGuidelinesDosage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['dosage'] = json_hash['dosage'].map { |var| Dosage.transform_json(var) } unless json_hash['dosage'].nil?

      result
    end
  end
end
