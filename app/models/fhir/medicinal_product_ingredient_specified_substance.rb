module FHIR
  # fhir/medicinal_product_ingredient_specified_substance.rb
  class MedicinalProductIngredientSpecifiedSubstance < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :group, class_name: 'FHIR::CodeableConcept'    
    embeds_one :confidentiality, class_name: 'FHIR::CodeableConcept'    
    embeds_many :strength, class_name: 'FHIR::MedicinalProductIngredientSpecifiedSubstanceStrength'    

    def self.transform_json(json_hash, target = MedicinalProductIngredientSpecifiedSubstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['group'] = CodeableConcept.transform_json(json_hash['group']) unless json_hash['group'].nil?
      result['confidentiality'] = CodeableConcept.transform_json(json_hash['confidentiality']) unless json_hash['confidentiality'].nil?
      result['strength'] = json_hash['strength'].map { |var| MedicinalProductIngredientSpecifiedSubstanceStrength.transform_json(var) } unless json_hash['strength'].nil?

      result
    end
  end
end
