module FHIR
  # fhir/operation_definition_parameter.rb
  class OperationDefinitionParameter < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :use, class_name: 'FHIR::OperationParameterUse'    
    embeds_one :min, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :max, class_name: 'FHIR::PrimitiveString'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::FHIRAllTypes'    
    embeds_many :targetProfile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :searchType, class_name: 'FHIR::SearchParamType'    
    embeds_one :binding, class_name: 'FHIR::OperationDefinitionParameterBinding'    
    embeds_many :referencedFrom, class_name: 'FHIR::OperationDefinitionParameterReferencedFrom'    
    embeds_many :part, class_name: 'FHIR::OperationDefinitionParameter'    
    
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
      unless self.targetProfile.nil?  || !self.targetProfile.any? 
        result['targetProfile'] = self.targetProfile.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.targetProfile)                              
        result['_targetProfile'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.searchType.nil? 
        result['searchType'] = self.searchType.value
        serialized = Extension.serializePrimitiveExtension(self.searchType)            
        result['_searchType'] = serialized unless serialized.nil?
      end
      unless self.binding.nil? 
        result['binding'] = self.binding.as_json(*args)
      end
      unless self.referencedFrom.nil?  || !self.referencedFrom.any? 
        result['referencedFrom'] = self.referencedFrom.map{ |x| x.as_json(*args) }
      end
      unless self.part.nil?  || !self.part.any? 
        result['part'] = self.part.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationDefinitionParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveCode.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['use'] = OperationParameterUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?
      result['type'] = FHIRAllTypes.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['targetProfile'] = json_hash['targetProfile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_targetProfile'] && json_hash['_targetProfile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['targetProfile'].nil?
      result['searchType'] = SearchParamType.transform_json(json_hash['searchType'], json_hash['_searchType']) unless json_hash['searchType'].nil?
      result['binding'] = OperationDefinitionParameterBinding.transform_json(json_hash['binding']) unless json_hash['binding'].nil?
      result['referencedFrom'] = json_hash['referencedFrom'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          OperationDefinitionParameterReferencedFrom.transform_json(var) 
        end
      } unless json_hash['referencedFrom'].nil?
      result['part'] = json_hash['part'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          OperationDefinitionParameter.transform_json(var) 
        end
      } unless json_hash['part'].nil?

      result
    end
  end
end
