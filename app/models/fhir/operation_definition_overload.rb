module FHIR
  # fhir/operation_definition_overload.rb
  class OperationDefinitionOverload < BackboneElement
    include Mongoid::Document
    embeds_many :parameterName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.parameterName.nil?  || !self.parameterName.any? 
        result['parameterName'] = self.parameterName.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.parameterName)                              
        result['_parameterName'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = OperationDefinitionOverload.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['parameterName'] = json_hash['parameterName'].each_with_index.map do |var, i|
        extension_hash = json_hash['_parameterName'] && json_hash['_parameterName'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['parameterName'].nil?
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?

      result
    end
  end
end
