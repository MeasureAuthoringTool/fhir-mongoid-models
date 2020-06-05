module FHIR
  class NutritionOrderSupplement < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrderSupplement'
    embeds_one :type, class_name: 'CodeableConcept'
    field :productName, type:  # primitive
    embeds_one :_productName, class_name: 'Extension'
    embeds_many :schedule, class_name: 'Timing'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    field :instruction, type:  # primitive
    embeds_one :_instruction, class_name: 'Extension'
  end
end
