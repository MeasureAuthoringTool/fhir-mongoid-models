module FHIR
  # fhir/structure_map_group.rb
  class StructureMapGroup < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveId'    
    embeds_one :extends, class_name: 'FHIR::PrimitiveId'    
    embeds_one :typeMode, class_name: 'FHIR::StructureMapGroupTypeMode'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveString'    
    embeds_many :input, class_name: 'FHIR::StructureMapGroupInput'    
    embeds_many :rule, class_name: 'FHIR::StructureMapGroupRule'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.extends.nil? 
        result['extends'] = self.extends.value
        serialized = Extension.serializePrimitiveExtension(self.extends)            
        result['_extends'] = serialized unless serialized.nil?
      end
      unless self.typeMode.nil? 
        result['typeMode'] = self.typeMode.value
        serialized = Extension.serializePrimitiveExtension(self.typeMode)            
        result['_typeMode'] = serialized unless serialized.nil?
      end
      unless self.documentation.nil? 
        result['documentation'] = self.documentation.value
        serialized = Extension.serializePrimitiveExtension(self.documentation)            
        result['_documentation'] = serialized unless serialized.nil?
      end
      unless self.input.nil?  || !self.input.any? 
        result['input'] = self.input.map{ |x| x.as_json(*args) }
      end
      unless self.rule.nil?  || !self.rule.any? 
        result['rule'] = self.rule.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureMapGroup.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveId.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['extends'] = PrimitiveId.transform_json(json_hash['extends'], json_hash['_extends']) unless json_hash['extends'].nil?
      result['typeMode'] = StructureMapGroupTypeMode.transform_json(json_hash['typeMode'], json_hash['_typeMode']) unless json_hash['typeMode'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?
      result['input'] = json_hash['input'].map { |var| StructureMapGroupInput.transform_json(var) } unless json_hash['input'].nil?
      result['rule'] = json_hash['rule'].map { |var| StructureMapGroupRule.transform_json(var) } unless json_hash['rule'].nil?

      result
    end
  end
end
