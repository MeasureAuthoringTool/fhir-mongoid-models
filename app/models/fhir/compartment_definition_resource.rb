module FHIR
  # fhir/compartment_definition_resource.rb
  class CompartmentDefinitionResource < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::ResourceType'    
    embeds_many :param, class_name: 'FHIR::PrimitiveString'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.param.nil?  || !self.param.any? 
        result['param'] = self.param.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.param)                              
        result['_param'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CompartmentDefinitionResource.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = ResourceType.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['param'] = json_hash['param'].each_with_index.map do |var, i|
        extension_hash = json_hash['_param'] && json_hash['_param'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['param'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
