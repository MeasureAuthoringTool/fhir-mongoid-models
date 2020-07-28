module FHIR
  # fhir/nutrition_order_status.rb
  class NutritionOrderStatus < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = NutritionOrderStatus.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
