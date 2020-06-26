module FHIR
  # fhir/medication_knowledge_related_medication_knowledge.rb
  class MedicationKnowledgeRelatedMedicationKnowledge < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRelatedMedicationKnowledge'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :reference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = MedicationKnowledgeRelatedMedicationKnowledge.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['reference'] = json_hash['reference'].map { |var| Reference.transform_json(var) } unless json_hash['reference'].nil?

      result
    end
  end
end
