module FHIR
  # fhir/medicinal_product_interaction_interactant.rb
  class MedicinalProductInteractionInteractant < BackboneElement
    include Mongoid::Document
    embeds_one :itemReference, class_name: 'Reference'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = MedicinalProductInteractionInteractant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?      
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?      

      result
    end
  end
end
