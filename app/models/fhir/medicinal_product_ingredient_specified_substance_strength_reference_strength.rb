module FHIR
  # fhir/medicinal_product_ingredient_specified_substance_strength_reference_strength.rb
  class MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength < BackboneElement
    include Mongoid::Document
    embeds_one :substance, class_name: 'FHIR::CodeableConcept'    
    embeds_one :strength, class_name: 'FHIR::Ratio'    
    embeds_one :strengthLowLimit, class_name: 'FHIR::Ratio'    
    embeds_one :measurementPoint, class_name: 'FHIR::PrimitiveString'    
    embeds_many :country, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.substance.nil? 
        result['substance'] = self.substance.as_json(*args)
      end
      unless self.strength.nil? 
        result['strength'] = self.strength.as_json(*args)
      end
      unless self.strengthLowLimit.nil? 
        result['strengthLowLimit'] = self.strengthLowLimit.as_json(*args)
      end
      unless self.measurementPoint.nil? 
        result['measurementPoint'] = self.measurementPoint.value
        serialized = Extension.serializePrimitiveExtension(self.measurementPoint)            
        result['_measurementPoint'] = serialized unless serialized.nil?
      end
      unless self.country.nil?  || !self.country.any? 
        result['country'] = self.country.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength.new)
      result = self.superclass.transform_json(json_hash, target)
      result['substance'] = CodeableConcept.transform_json(json_hash['substance']) unless json_hash['substance'].nil?
      result['strength'] = Ratio.transform_json(json_hash['strength']) unless json_hash['strength'].nil?
      result['strengthLowLimit'] = Ratio.transform_json(json_hash['strengthLowLimit']) unless json_hash['strengthLowLimit'].nil?
      result['measurementPoint'] = PrimitiveString.transform_json(json_hash['measurementPoint'], json_hash['_measurementPoint']) unless json_hash['measurementPoint'].nil?
      result['country'] = json_hash['country'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['country'].nil?

      result
    end
  end
end
