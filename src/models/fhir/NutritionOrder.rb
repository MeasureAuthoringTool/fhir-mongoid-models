module FHIR
  class NutritionOrder < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'NutritionOrder'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    field :instantiates, type: Array # primitive
    embeds_many :_instantiates, class_name: 'Extension'
    embeds_one :status, class_name: 'NutritionOrderStatus'
    embeds_one :intent, class_name: 'NutritiionOrderIntent'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :dateTime, type:  # primitive
    embeds_one :_dateTime, class_name: 'Extension'
    embeds_one :orderer, class_name: 'Reference'
    embeds_many :allergyIntolerance, class_name: 'Reference'
    embeds_many :foodPreferenceModifier, class_name: 'CodeableConcept'
    embeds_many :excludeFoodModifier, class_name: 'CodeableConcept'
    embeds_one :oralDiet, class_name: 'NutritionOrderOralDiet'
    embeds_many :supplement, class_name: 'NutritionOrderSupplement'
    embeds_one :enteralFormula, class_name: 'NutritionOrderEnteralFormula'
    embeds_many :note, class_name: 'Annotation'
  end
end
