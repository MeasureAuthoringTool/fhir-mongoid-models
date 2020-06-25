module FHIR
  # fhir/medication_knowledge_regulatory_max_dispense.rb
  class MedicationKnowledgeRegulatoryMaxDispense < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationKnowledgeRegulatoryMaxDispense'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :period, class_name: 'Duration'

    def self.transform_json(json_hash)
      result = MedicationKnowledgeRegulatoryMaxDispense.new
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['period'] = Duration.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
