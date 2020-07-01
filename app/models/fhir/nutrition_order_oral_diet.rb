module FHIR
  # fhir/nutrition_order_oral_diet.rb
  class NutritionOrderOralDiet < BackboneElement
    include Mongoid::Document
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :schedule, class_name: 'Timing'
    embeds_many :nutrient, class_name: 'NutritionOrderOralDietNutrient'
    embeds_many :texture, class_name: 'NutritionOrderOralDietTexture'
    embeds_many :fluidConsistencyType, class_name: 'CodeableConcept'
    embeds_one :instruction, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = NutritionOrderOralDiet.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['schedule'] = json_hash['schedule'].map { |var| Timing.transform_json(var) } unless json_hash['schedule'].nil?
      result['nutrient'] = json_hash['nutrient'].map { |var| NutritionOrderOralDietNutrient.transform_json(var) } unless json_hash['nutrient'].nil?
      result['texture'] = json_hash['texture'].map { |var| NutritionOrderOralDietTexture.transform_json(var) } unless json_hash['texture'].nil?
      result['fluidConsistencyType'] = json_hash['fluidConsistencyType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['fluidConsistencyType'].nil?
      result['instruction'] = PrimitiveString.transform_json(json_hash['instruction'], json_hash['_instruction']) unless json_hash['instruction'].nil?      

      result
    end
  end
end
