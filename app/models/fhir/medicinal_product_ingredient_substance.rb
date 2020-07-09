module FHIR
  # fhir/medicinal_product_ingredient_substance.rb
  class MedicinalProductIngredientSubstance < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :strength, class_name: 'FHIR::MedicinalProductIngredientSpecifiedSubstanceStrength'

    def self.transform_json(json_hash, target = MedicinalProductIngredientSubstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['strength'] = json_hash['strength'].map { |var| MedicinalProductIngredientSpecifiedSubstanceStrength.transform_json(var) } unless json_hash['strength'].nil?

      result
    end
  end
end
