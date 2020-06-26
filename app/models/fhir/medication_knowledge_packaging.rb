module FHIR
  # fhir/medication_knowledge_packaging.rb
  class MedicationKnowledgePackaging < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgePackaging'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'

    def self.transform_json(json_hash)
      result = MedicationKnowledgePackaging.new
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      

      result
    end
  end
end
