module FHIR
  # fhir/nutrition_order_supplement.rb
  class NutritionOrderSupplement < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderSupplement'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :productName, class_name: 'PrimitiveString'
    embeds_many :schedule, class_name: 'Timing'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :instruction, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=NutritionOrderSupplement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['productName'] = PrimitiveString.transform_json(json_hash['productName'], json_hash['_productName']) unless json_hash['productName'].nil?      
      result['schedule'] = json_hash['schedule'].map { |var| Timing.transform_json(var) } unless json_hash['schedule'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['instruction'] = PrimitiveString.transform_json(json_hash['instruction'], json_hash['_instruction']) unless json_hash['instruction'].nil?      

      result
    end
  end
end
