module FHIR
  # fhir/medication_knowledge_ingredient.rb
  class MedicationKnowledgeIngredient < BackboneElement
    include Mongoid::Document
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :itemReference, class_name: 'FHIR::Reference'
    embeds_one :isActive, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :strength, class_name: 'FHIR::Ratio'

    def self.transform_json(json_hash, target = MedicationKnowledgeIngredient.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?      
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?      
      result['isActive'] = PrimitiveBoolean.transform_json(json_hash['isActive'], json_hash['_isActive']) unless json_hash['isActive'].nil?      
      result['strength'] = Ratio.transform_json(json_hash['strength']) unless json_hash['strength'].nil?      

      result
    end
  end
end
