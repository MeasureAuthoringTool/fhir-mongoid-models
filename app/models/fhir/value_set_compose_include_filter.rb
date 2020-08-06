module FHIR
  # fhir/value_set_compose_include_filter.rb
  class ValueSetComposeIncludeFilter < BackboneElement
    include Mongoid::Document
    embeds_one :property, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :op, class_name: 'FHIR::FilterOperator'    
    embeds_one :value, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.property.nil? 
        result['property'] = self.property.value
        serialized = Extension.serializePrimitiveExtension(self.property)            
        result['_property'] = serialized unless serialized.nil?
      end
      unless self.op.nil? 
        result['op'] = self.op.value
        serialized = Extension.serializePrimitiveExtension(self.op)            
        result['_op'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = ValueSetComposeIncludeFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['property'] = PrimitiveCode.transform_json(json_hash['property'], json_hash['_property']) unless json_hash['property'].nil?
      result['op'] = FilterOperator.transform_json(json_hash['op'], json_hash['_op']) unless json_hash['op'].nil?
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?

      result
    end
  end
end
