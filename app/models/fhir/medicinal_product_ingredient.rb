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
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      unless self.allergenicIndicator.nil? 
        result['allergenicIndicator'] = self.allergenicIndicator.value
        serialized = Extension.serializePrimitiveExtension(self.allergenicIndicator)            
        result['_allergenicIndicator'] = serialized unless serialized.nil?
      end
      unless self.manufacturer.nil?  || !self.manufacturer.any? 
        result['manufacturer'] = self.manufacturer.map{ |x| x.as_json(*args) }
      end
      unless self.specifiedSubstance.nil?  || !self.specifiedSubstance.any? 
        result['specifiedSubstance'] = self.specifiedSubstance.map{ |x| x.as_json(*args) }
      end
      unless self.substance.nil? 
        result['substance'] = self.substance.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
