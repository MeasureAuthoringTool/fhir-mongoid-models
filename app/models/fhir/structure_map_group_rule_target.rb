module FHIR
  # fhir/structure_map_group_rule_target.rb
  class StructureMapGroupRuleTarget < BackboneElement
    include Mongoid::Document
    embeds_one :context, class_name: 'FHIR::PrimitiveId'    
    embeds_one :contextType, class_name: 'FHIR::StructureMapContextType'    
    embeds_one :element, class_name: 'FHIR::PrimitiveString'    
    embeds_one :variable, class_name: 'FHIR::PrimitiveId'    
    embeds_many :listMode, class_name: 'FHIR::StructureMapTargetListMode'    
    embeds_one :listRuleId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :transform, class_name: 'FHIR::StructureMapTransform'    
    embeds_many :parameter, class_name: 'FHIR::StructureMapGroupRuleTargetParameter'    
    
    def as_json(*args)
      result = super      
      unless self.context.nil? 
        result['context'] = self.context.value
        serialized = Extension.serializePrimitiveExtension(self.context)            
        result['_context'] = serialized unless serialized.nil?
      end
      unless self.contextType.nil? 
        result['contextType'] = self.contextType.value
        serialized = Extension.serializePrimitiveExtension(self.contextType)            
        result['_contextType'] = serialized unless serialized.nil?
      end
      unless self.element.nil? 
        result['element'] = self.element.value
        serialized = Extension.serializePrimitiveExtension(self.element)            
        result['_element'] = serialized unless serialized.nil?
      end
      unless self.variable.nil? 
        result['variable'] = self.variable.value
        serialized = Extension.serializePrimitiveExtension(self.variable)            
        result['_variable'] = serialized unless serialized.nil?
      end
      unless self.listMode.nil?  || !self.listMode.any? 
        result['listMode'] = self.listMode.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.listMode)                              
        result['_listMode'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.listRuleId.nil? 
        result['listRuleId'] = self.listRuleId.value
        serialized = Extension.serializePrimitiveExtension(self.listRuleId)            
        result['_listRuleId'] = serialized unless serialized.nil?
      end
      unless self.transform.nil? 
        result['transform'] = self.transform.value
        serialized = Extension.serializePrimitiveExtension(self.transform)            
        result['_transform'] = serialized unless serialized.nil?
      end
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = StructureMapGroupRuleTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['context'] = PrimitiveId.transform_json(json_hash['context'], json_hash['_context']) unless json_hash['context'].nil?
      result['contextType'] = StructureMapContextType.transform_json(json_hash['contextType'], json_hash['_contextType']) unless json_hash['contextType'].nil?
      result['element'] = PrimitiveString.transform_json(json_hash['element'], json_hash['_element']) unless json_hash['element'].nil?
      result['variable'] = PrimitiveId.transform_json(json_hash['variable'], json_hash['_variable']) unless json_hash['variable'].nil?
      result['listMode'] = json_hash['listMode'].each_with_index.map do |var, i|
        extension_hash = json_hash['_listMode'] && json_hash['_listMode'][i]
        StructureMapTargetListMode.transform_json(var, extension_hash)
      end unless json_hash['listMode'].nil?
      result['listRuleId'] = PrimitiveId.transform_json(json_hash['listRuleId'], json_hash['_listRuleId']) unless json_hash['listRuleId'].nil?
      result['transform'] = StructureMapTransform.transform_json(json_hash['transform'], json_hash['_transform']) unless json_hash['transform'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          StructureMapGroupRuleTargetParameter.transform_json(var) 
        end
      } unless json_hash['parameter'].nil?

      result
    end
  end
end
