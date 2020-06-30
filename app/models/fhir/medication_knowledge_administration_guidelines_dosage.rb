module FHIR
  # fhir/medication_knowledge_administration_guidelines_dosage.rb
  class MedicationKnowledgeAdministrationGuidelinesDosage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeAdministrationGuidelinesDosage'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :dosage, class_name: 'Dosage'

    def self.transform_json(json_hash, target=MedicationKnowledgeAdministrationGuidelinesDosage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['dosage'] = json_hash['dosage'].map { |var| Dosage.transform_json(var) } unless json_hash['dosage'].nil?

      result
    end
  end
end
