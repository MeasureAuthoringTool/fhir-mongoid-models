module FHIR
  # fhir/medicinal_product_interaction_interactant.rb
  class MedicinalProductInteractionInteractant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductInteractionInteractant'
    embeds_one :itemReference, class_name: 'Reference'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = MedicinalProductInteractionInteractant.new
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?      
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?      

      result
    end
  end
end
