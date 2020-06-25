module FHIR
  # fhir/medicinal_product_ingredient_specified_substance_strength.rb
  class MedicinalProductIngredientSpecifiedSubstanceStrength < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIngredientSpecifiedSubstanceStrength'
    embeds_one :presentation, class_name: 'Ratio'
    embeds_one :presentationLowLimit, class_name: 'Ratio'
    embeds_one :concentration, class_name: 'Ratio'
    embeds_one :concentrationLowLimit, class_name: 'Ratio'
    embeds_one :measurementPoint, class_name: 'PrimitiveString'
    embeds_many :country, class_name: 'CodeableConcept'
    embeds_many :referenceStrength, class_name: 'MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength'

    def self.transform_json(json_hash)
      result = MedicinalProductIngredientSpecifiedSubstanceStrength.new
      result['presentation'] = Ratio.transform_json(json_hash['presentation']) unless json_hash['presentation'].nil?      
      result['presentationLowLimit'] = Ratio.transform_json(json_hash['presentationLowLimit']) unless json_hash['presentationLowLimit'].nil?      
      result['concentration'] = Ratio.transform_json(json_hash['concentration']) unless json_hash['concentration'].nil?      
      result['concentrationLowLimit'] = Ratio.transform_json(json_hash['concentrationLowLimit']) unless json_hash['concentrationLowLimit'].nil?      
      result['measurementPoint'] = PrimitiveString.transform_json(json_hash['measurementPoint'], json_hash['_measurementPoint']) unless json_hash['measurementPoint'].nil?      
      result['country'] = json_hash['country'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['country'].nil?
      result['referenceStrength'] = json_hash['referenceStrength'].map { |var| MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength.transform_json(var) } unless json_hash['referenceStrength'].nil?

      result
    end
  end
end
