module FHIR
  # fhir/parameter_definition.rb
  class ParameterDefinition < Element
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :use, class_name: 'FHIR::ParameterUse'    
    embeds_one :min, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :max, class_name: 'FHIR::PrimitiveString'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::FHIRAllTypes'    
    embeds_one :profile, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.min.nil? 
        result['min'] = self.min.value
        serialized = Extension.serializePrimitiveExtension(self.min)            
        result['_min'] = serialized unless serialized.nil?
      end
      unless self.max.nil? 
        result['max'] = self.max.value
        serialized = Extension.serializePrimitiveExtension(self.max)            
        result['_max'] = serialized unless serialized.nil?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.profile.nil? 
        result['profile'] = self.profile.value
        serialized = Extension.serializePrimitiveExtension(self.profile)            
        result['_profile'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ParameterDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveCode.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['use'] = ParameterUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?
      result['type'] = FHIRAllTypes.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?

      result
    end
  end
end
