module FHIR
  # fhir/nutrition_order_status.rb
  class NutritionOrderStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = NutritionOrderStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
