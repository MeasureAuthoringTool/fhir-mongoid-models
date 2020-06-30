module FHIR
  # fhir/substance_ingredient.rb
  class SubstanceIngredient < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceIngredient'
    embeds_one :quantity, class_name: 'Ratio'
    embeds_one :substanceCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :substanceReference, class_name: 'Reference'

    def self.transform_json(json_hash, target=SubstanceIngredient.new)
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = Ratio.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['substanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['substanceCodeableConcept']) unless json_hash['substanceCodeableConcept'].nil?      
      result['substanceReference'] = Reference.transform_json(json_hash['substanceReference']) unless json_hash['substanceReference'].nil?      

      result
    end
  end
end
