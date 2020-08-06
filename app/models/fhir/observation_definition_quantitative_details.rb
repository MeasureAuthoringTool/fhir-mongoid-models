module FHIR
  # fhir/observation_definition_quantitative_details.rb
  class ObservationDefinitionQuantitativeDetails < BackboneElement
    include Mongoid::Document
    embeds_one :customaryUnit, class_name: 'FHIR::CodeableConcept'    
    embeds_one :unit, class_name: 'FHIR::CodeableConcept'    
    embeds_one :conversionFactor, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :decimalPrecision, class_name: 'FHIR::PrimitiveInteger'    
    
    def as_json(*args)
      result = super      
      unless self.customaryUnit.nil? 
        result['customaryUnit'] = self.customaryUnit.as_json(*args)
      end
      unless self.unit.nil? 
        result['unit'] = self.unit.as_json(*args)
      end
      unless self.conversionFactor.nil? 
        result['conversionFactor'] = self.conversionFactor.value
        serialized = Extension.serializePrimitiveExtension(self.conversionFactor)            
        result['_conversionFactor'] = serialized unless serialized.nil?
      end
      unless self.decimalPrecision.nil? 
        result['decimalPrecision'] = self.decimalPrecision.value
        serialized = Extension.serializePrimitiveExtension(self.decimalPrecision)            
        result['_decimalPrecision'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ObservationDefinitionQuantitativeDetails.new)
      result = self.superclass.transform_json(json_hash, target)
      result['customaryUnit'] = CodeableConcept.transform_json(json_hash['customaryUnit']) unless json_hash['customaryUnit'].nil?
      result['unit'] = CodeableConcept.transform_json(json_hash['unit']) unless json_hash['unit'].nil?
      result['conversionFactor'] = PrimitiveDecimal.transform_json(json_hash['conversionFactor'], json_hash['_conversionFactor']) unless json_hash['conversionFactor'].nil?
      result['decimalPrecision'] = PrimitiveInteger.transform_json(json_hash['decimalPrecision'], json_hash['_decimalPrecision']) unless json_hash['decimalPrecision'].nil?

      result
    end
  end
end
