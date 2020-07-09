module FHIR
  # fhir/medication_knowledge_related_medication_knowledge.rb
  class MedicationKnowledgeRelatedMedicationKnowledge < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_many :reference, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = MedicationKnowledgeRelatedMedicationKnowledge.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['reference'] = json_hash['reference'].map { |var| Reference.transform_json(var) } unless json_hash['reference'].nil?

      result
    end
  end
end
