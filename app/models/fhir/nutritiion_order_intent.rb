module FHIR
  # fhir/nutritiion_order_intent.rb
  class NutritiionOrderIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritiionOrderIntent'
    field :value, type: String

    def self.transform_json(json_hash, target=NutritiionOrderIntent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
