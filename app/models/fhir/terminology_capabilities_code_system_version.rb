module FHIR
  # fhir/terminology_capabilities_code_system_version.rb
  class TerminologyCapabilitiesCodeSystemVersion < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveString'    
    embeds_one :isDefault, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :compositional, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :language, class_name: 'FHIR::PrimitiveCode'    
    embeds_many :filter, class_name: 'FHIR::TerminologyCapabilitiesCodeSystemVersionFilter'    
    embeds_many :property, class_name: 'FHIR::PrimitiveCode'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.isDefault.nil? 
        result['isDefault'] = self.isDefault.value
        serialized = Extension.serializePrimitiveExtension(self.isDefault)            
        result['_isDefault'] = serialized unless serialized.nil?
      end
      unless self.compositional.nil? 
        result['compositional'] = self.compositional.value
        serialized = Extension.serializePrimitiveExtension(self.compositional)            
        result['_compositional'] = serialized unless serialized.nil?
      end
      unless self.language.nil?  || !self.language.any? 
        result['language'] = self.language.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.language)                              
        result['_language'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.filter.nil?  || !self.filter.any? 
        result['filter'] = self.filter.map{ |x| x.as_json(*args) }
      end
      unless self.property.nil?  || !self.property.any? 
        result['property'] = self.property.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.property)                              
        result['_property'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilitiesCodeSystemVersion.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveString.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['isDefault'] = PrimitiveBoolean.transform_json(json_hash['isDefault'], json_hash['_isDefault']) unless json_hash['isDefault'].nil?
      result['compositional'] = PrimitiveBoolean.transform_json(json_hash['compositional'], json_hash['_compositional']) unless json_hash['compositional'].nil?
      result['language'] = json_hash['language'].each_with_index.map do |var, i|
        extension_hash = json_hash['_language'] && json_hash['_language'][i]
        PrimitiveCode.transform_json(var, extension_hash)
      end unless json_hash['language'].nil?
      result['filter'] = json_hash['filter'].map { |var| TerminologyCapabilitiesCodeSystemVersionFilter.transform_json(var) } unless json_hash['filter'].nil?
      result['property'] = json_hash['property'].each_with_index.map do |var, i|
        extension_hash = json_hash['_property'] && json_hash['_property'][i]
        PrimitiveCode.transform_json(var, extension_hash)
      end unless json_hash['property'].nil?

      result
    end
  end
end
