module FHIR
  # fhir/medicinal_product_ingredient_specified_substance_strength_reference_strength.rb
  class MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength < BackboneElement
    include Mongoid::Document
    embeds_one :substance, class_name: 'CodeableConcept'
    embeds_one :strength, class_name: 'Ratio'
    embeds_one :strengthLowLimit, class_name: 'Ratio'
    embeds_one :measurementPoint, class_name: 'PrimitiveString'
    embeds_many :country, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target = MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?      
      result['strength'] = Ratio.transform_json(json_hash['strength']) unless json_hash['strength'].nil?      
      result['strengthLowLimit'] = Ratio.transform_json(json_hash['strengthLowLimit']) unless json_hash['strengthLowLimit'].nil?      
      result['measurementPoint'] = PrimitiveString.transform_json(json_hash['measurementPoint'], json_hash['_measurementPoint']) unless json_hash['measurementPoint'].nil?      
      result['country'] = json_hash['country'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['country'].nil?

      result
    end
  end
end
