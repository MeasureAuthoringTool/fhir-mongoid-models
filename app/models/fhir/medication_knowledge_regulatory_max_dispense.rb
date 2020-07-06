module FHIR
  # fhir/medication_knowledge_regulatory_max_dispense.rb
  class MedicationKnowledgeRegulatoryMaxDispense < BackboneElement
    include Mongoid::Document
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :period, class_name: 'Duration'

    def self.transform_json(json_hash, target = MedicationKnowledgeRegulatoryMaxDispense.new)
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['period'] = Duration.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
