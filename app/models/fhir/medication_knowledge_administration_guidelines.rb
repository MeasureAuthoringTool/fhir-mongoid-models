module FHIR
  # fhir/medication_knowledge_administration_guidelines.rb
  class MedicationKnowledgeAdministrationGuidelines < BackboneElement
    include Mongoid::Document
    embeds_many :dosage, class_name: 'MedicationKnowledgeAdministrationGuidelinesDosage'
    embeds_one :indicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :indicationReference, class_name: 'Reference'
    embeds_many :patientCharacteristics, class_name: 'MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics'

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
