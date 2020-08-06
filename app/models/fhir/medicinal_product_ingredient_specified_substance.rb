module FHIR
  # fhir/medicinal_product_ingredient_specified_substance.rb
  class MedicinalProductIngredientSpecifiedSubstance < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :group, class_name: 'FHIR::CodeableConcept'    
    embeds_one :confidentiality, class_name: 'FHIR::CodeableConcept'    
    embeds_many :strength, class_name: 'FHIR::MedicinalProductIngredientSpecifiedSubstanceStrength'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.group.nil? 
        result['group'] = self.group.as_json(*args)
      end
      unless self.confidentiality.nil? 
        result['confidentiality'] = self.confidentiality.as_json(*args)
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

    def self.transform_json(json_hash, target = MedicinalProductIngredientSpecifiedSubstance.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['group'] = CodeableConcept.transform_json(json_hash['group']) unless json_hash['group'].nil?
      result['confidentiality'] = CodeableConcept.transform_json(json_hash['confidentiality']) unless json_hash['confidentiality'].nil?
      result['strength'] = json_hash['strength'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductIngredientSpecifiedSubstanceStrength.transform_json(var) 
        end
      } unless json_hash['strength'].nil?

      result
    end
  end
end
