module FHIR
  # fhir/medicinal_product_ingredient.rb
  class MedicinalProductIngredient < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    embeds_one :allergenicIndicator, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :manufacturer, class_name: 'FHIR::Reference'    
    embeds_many :specifiedSubstance, class_name: 'FHIR::MedicinalProductIngredientSpecifiedSubstance'    
    embeds_one :substance, class_name: 'FHIR::MedicinalProductIngredientSubstance'    

    def self.transform_json(json_hash, target = MedicinalProductIngredient.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?
      result['allergenicIndicator'] = PrimitiveBoolean.transform_json(json_hash['allergenicIndicator'], json_hash['_allergenicIndicator']) unless json_hash['allergenicIndicator'].nil?
      result['manufacturer'] = json_hash['manufacturer'].map { |var| Reference.transform_json(var) } unless json_hash['manufacturer'].nil?
      result['specifiedSubstance'] = json_hash['specifiedSubstance'].map { |var| MedicinalProductIngredientSpecifiedSubstance.transform_json(var) } unless json_hash['specifiedSubstance'].nil?
      result['substance'] = MedicinalProductIngredientSubstance.transform_json(json_hash['substance']) unless json_hash['substance'].nil?

      result
    end
  end
end
