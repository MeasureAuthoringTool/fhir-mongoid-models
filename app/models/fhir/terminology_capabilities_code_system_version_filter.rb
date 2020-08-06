module FHIR
  # fhir/terminology_capabilities_code_system_version_filter.rb
  class TerminologyCapabilitiesCodeSystemVersionFilter < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_many :op, class_name: 'FHIR::PrimitiveCode'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.op.nil?  || !self.op.any? 
        result['op'] = self.op.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.op)                              
        result['_op'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilitiesCodeSystemVersionFilter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['op'] = json_hash['op'].each_with_index.map do |var, i|
        extension_hash = json_hash['_op'] && json_hash['_op'][i]
        PrimitiveCode.transform_json(var, extension_hash)
      end unless json_hash['op'].nil?

      result
    end
  end
end
