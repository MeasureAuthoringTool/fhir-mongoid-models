module FHIR
  # fhir/medication_knowledge_status.rb
  class MedicationKnowledgeStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = MedicationKnowledgeStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
