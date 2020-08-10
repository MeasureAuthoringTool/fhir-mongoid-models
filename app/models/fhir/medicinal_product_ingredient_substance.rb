module FHIR
  # fhir/medicinal_product_ingredient_substance.rb
  class MedicinalProductIngredientSubstance < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :strength, class_name: 'FHIR::MedicinalProductIngredientSpecifiedSubstanceStrength'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.strength.nil?  || !self.strength.any? 
        result['strength'] = self.strength.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductIngredientSubstance.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['strength'] = json_hash['strength'].map { |var| MedicinalProductIngredientSpecifiedSubstanceStrength.transform_json(var) } unless json_hash['strength'].nil?

      result
    end
  end
end
