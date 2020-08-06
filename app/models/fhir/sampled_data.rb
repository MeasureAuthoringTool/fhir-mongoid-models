module FHIR
  # fhir/sampled_data.rb
  class SampledData < Element
    include Mongoid::Document
    embeds_one :origin, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :period, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :factor, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :lowerLimit, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :upperLimit, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :dimensions, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :data, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.origin.nil? 
        result['origin'] = self.origin.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.value
        serialized = Extension.serializePrimitiveExtension(self.period)            
        result['_period'] = serialized unless serialized.nil?
      end
      unless self.factor.nil? 
        result['factor'] = self.factor.value
        serialized = Extension.serializePrimitiveExtension(self.factor)            
        result['_factor'] = serialized unless serialized.nil?
      end
      unless self.lowerLimit.nil? 
        result['lowerLimit'] = self.lowerLimit.value
        serialized = Extension.serializePrimitiveExtension(self.lowerLimit)            
        result['_lowerLimit'] = serialized unless serialized.nil?
      end
      unless self.upperLimit.nil? 
        result['upperLimit'] = self.upperLimit.value
        serialized = Extension.serializePrimitiveExtension(self.upperLimit)            
        result['_upperLimit'] = serialized unless serialized.nil?
      end
      unless self.dimensions.nil? 
        result['dimensions'] = self.dimensions.value
        serialized = Extension.serializePrimitiveExtension(self.dimensions)            
        result['_dimensions'] = serialized unless serialized.nil?
      end
      unless self.data.nil? 
        result['data'] = self.data.value
        serialized = Extension.serializePrimitiveExtension(self.data)            
        result['_data'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SampledData.new)
      result = self.superclass.transform_json(json_hash, target)
      result['origin'] = SimpleQuantity.transform_json(json_hash['origin']) unless json_hash['origin'].nil?
      result['period'] = PrimitiveDecimal.transform_json(json_hash['period'], json_hash['_period']) unless json_hash['period'].nil?
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?
      result['lowerLimit'] = PrimitiveDecimal.transform_json(json_hash['lowerLimit'], json_hash['_lowerLimit']) unless json_hash['lowerLimit'].nil?
      result['upperLimit'] = PrimitiveDecimal.transform_json(json_hash['upperLimit'], json_hash['_upperLimit']) unless json_hash['upperLimit'].nil?
      result['dimensions'] = PrimitivePositiveInt.transform_json(json_hash['dimensions'], json_hash['_dimensions']) unless json_hash['dimensions'].nil?
      result['data'] = PrimitiveString.transform_json(json_hash['data'], json_hash['_data']) unless json_hash['data'].nil?

      result
    end
  end
end
