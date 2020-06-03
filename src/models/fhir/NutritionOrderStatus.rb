module FHIR
  class NutritionOrderStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
