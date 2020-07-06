module FHIR
  # fhir/medication_knowledge_cost.rb
  class MedicationKnowledgeCost < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :source, class_name: 'PrimitiveString'
    embeds_one :cost, class_name: 'Money'

    def self.transform_json(json_hash, target = MedicationKnowledgeCost.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['source'] = PrimitiveString.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      
      result['cost'] = Money.transform_json(json_hash['cost']) unless json_hash['cost'].nil?      

      result
    end
  end
end
