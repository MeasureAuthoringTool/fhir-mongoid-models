module FHIR
  # fhir/medicinal_product_ingredient_specified_substance_strength.rb
  class MedicinalProductIngredientSpecifiedSubstanceStrength < BackboneElement
    include Mongoid::Document
    embeds_one :presentation, class_name: 'FHIR::Ratio'    
    embeds_one :presentationLowLimit, class_name: 'FHIR::Ratio'    
    embeds_one :concentration, class_name: 'FHIR::Ratio'    
    embeds_one :concentrationLowLimit, class_name: 'FHIR::Ratio'    
    embeds_one :measurementPoint, class_name: 'FHIR::PrimitiveString'    
    embeds_many :country, class_name: 'FHIR::CodeableConcept'    
    embeds_many :referenceStrength, class_name: 'FHIR::MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength'    
    
    def as_json(*args)
      result = super      
      unless self.presentation.nil? 
        result['presentation'] = self.presentation.as_json(*args)
      end
      unless self.presentationLowLimit.nil? 
        result['presentationLowLimit'] = self.presentationLowLimit.as_json(*args)
      end
      unless self.concentration.nil? 
        result['concentration'] = self.concentration.as_json(*args)
      end
      unless self.concentrationLowLimit.nil? 
        result['concentrationLowLimit'] = self.concentrationLowLimit.as_json(*args)
      end
      unless self.measurementPoint.nil? 
        result['measurementPoint'] = self.measurementPoint.value
        serialized = Extension.serializePrimitiveExtension(self.measurementPoint)            
        result['_measurementPoint'] = serialized unless serialized.nil?
      end
      unless self.country.nil?  || !self.country.any? 
        result['country'] = self.country.map{ |x| x.as_json(*args) }
      end
      unless self.referenceStrength.nil?  || !self.referenceStrength.any? 
        result['referenceStrength'] = self.referenceStrength.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductIngredientSpecifiedSubstanceStrength.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['presentation'] = Ratio.transform_json(json_hash['presentation']) unless json_hash['presentation'].nil?
      result['presentationLowLimit'] = Ratio.transform_json(json_hash['presentationLowLimit']) unless json_hash['presentationLowLimit'].nil?
      result['concentration'] = Ratio.transform_json(json_hash['concentration']) unless json_hash['concentration'].nil?
      result['concentrationLowLimit'] = Ratio.transform_json(json_hash['concentrationLowLimit']) unless json_hash['concentrationLowLimit'].nil?
      result['measurementPoint'] = PrimitiveString.transform_json(json_hash['measurementPoint'], json_hash['_measurementPoint']) unless json_hash['measurementPoint'].nil?
      result['country'] = json_hash['country'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['country'].nil?
      result['referenceStrength'] = json_hash['referenceStrength'].map { |var| MedicinalProductIngredientSpecifiedSubstanceStrengthReferenceStrength.transform_json(var) } unless json_hash['referenceStrength'].nil?

      result
    end
  end
end
