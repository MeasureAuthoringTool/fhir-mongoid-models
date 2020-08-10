module FHIR
  # fhir/structure_map_group_rule_dependent.rb
  class StructureMapGroupRuleDependent < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveId'    
    embeds_many :variable, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.variable.nil?  || !self.variable.any? 
        result['variable'] = self.variable.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.variable)                              
        result['_variable'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureMapGroupRuleDependent.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveId.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['variable'] = json_hash['variable'].each_with_index.map do |var, i|
        extension_hash = json_hash['_variable'] && json_hash['_variable'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['variable'].nil?

      result
    end
  end
end
