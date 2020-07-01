module FHIR
  # fhir/structure_map_group_rule_target.rb
  class StructureMapGroupRuleTarget < BackboneElement
    include Mongoid::Document
    embeds_one :context, class_name: 'PrimitiveId'
    embeds_one :contextType, class_name: 'StructureMapContextType'
    embeds_one :element, class_name: 'PrimitiveString'
    embeds_one :variable, class_name: 'PrimitiveId'
    embeds_many :listMode, class_name: 'StructureMapTargetListMode'
    embeds_one :listRuleId, class_name: 'PrimitiveId'
    embeds_one :transform, class_name: 'StructureMapTransform'
    embeds_many :parameter, class_name: 'StructureMapGroupRuleTargetParameter'

    def self.transform_json(json_hash, target = StructureMapGroupRuleTarget.new)
      result = self.superclass.transform_json(json_hash, target)
      result['context'] = PrimitiveId.transform_json(json_hash['context'], json_hash['_context']) unless json_hash['context'].nil?      
      result['contextType'] = StructureMapContextType.transform_json(json_hash['contextType']) unless json_hash['contextType'].nil?      
      result['element'] = PrimitiveString.transform_json(json_hash['element'], json_hash['_element']) unless json_hash['element'].nil?      
      result['variable'] = PrimitiveId.transform_json(json_hash['variable'], json_hash['_variable']) unless json_hash['variable'].nil?      
      result['listMode'] = json_hash['listMode'].map { |var| StructureMapTargetListMode.transform_json(var) } unless json_hash['listMode'].nil?
      result['listRuleId'] = PrimitiveId.transform_json(json_hash['listRuleId'], json_hash['_listRuleId']) unless json_hash['listRuleId'].nil?      
      result['transform'] = StructureMapTransform.transform_json(json_hash['transform']) unless json_hash['transform'].nil?      
      result['parameter'] = json_hash['parameter'].map { |var| StructureMapGroupRuleTargetParameter.transform_json(var) } unless json_hash['parameter'].nil?

      result
    end
  end
end
