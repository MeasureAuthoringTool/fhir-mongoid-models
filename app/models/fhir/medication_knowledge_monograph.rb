module FHIR
  # fhir/medication_knowledge_monograph.rb
  class MedicationKnowledgeMonograph < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeMonograph'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :source, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = MedicationKnowledgeMonograph.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?      

      result
    end
  end
end
