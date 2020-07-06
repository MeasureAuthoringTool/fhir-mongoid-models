module FHIR
  # fhir/nutrition_order_enteral_formula_administration.rb
  class NutritionOrderEnteralFormulaAdministration < BackboneElement
    include Mongoid::Document
    embeds_one :schedule, class_name: 'Timing'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :rateSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :rateRatio, class_name: 'Ratio'

    def self.transform_json(json_hash, target = NutritionOrderEnteralFormulaAdministration.new)
      result = self.superclass.transform_json(json_hash, target)
      result['schedule'] = Timing.transform_json(json_hash['schedule']) unless json_hash['schedule'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['rateSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['rateSimpleQuantity']) unless json_hash['rateSimpleQuantity'].nil?      
      result['rateRatio'] = Ratio.transform_json(json_hash['rateRatio']) unless json_hash['rateRatio'].nil?      

      result
    end
  end
end
