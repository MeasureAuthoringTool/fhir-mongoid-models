module FHIR
  # fhir/code_system_filter.rb
  class CodeSystemFilter < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :operator, class_name: 'FHIR::FilterOperator'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.operator.nil?  || !self.operator.any? 
        result['operator'] = self.operator.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.operator)                              
        result['_operator'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CodeSystemFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['operator'] = json_hash['operator'].each_with_index.map do |var, i|
        extension_hash = json_hash['_operator'] && json_hash['_operator'][i]
        FilterOperator.transform_json(var, extension_hash)
      end unless json_hash['operator'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
