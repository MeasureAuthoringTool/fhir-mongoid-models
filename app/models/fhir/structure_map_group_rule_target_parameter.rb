module FHIR
  # fhir/structure_map_group_rule_target_parameter.rb
  class StructureMapGroupRuleTargetParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRuleTargetParameter'
    embeds_one :valueid, class_name: 'PrimitiveId'
    embeds_one :valuestring, class_name: 'PrimitiveString'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'
    embeds_one :valueinteger, class_name: 'PrimitiveInteger'
    embeds_one :valuedecimal, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash)
      result = StructureMapGroupRuleTargetParameter.new
      result['valueid'] = PrimitiveId.transform_json(json_hash['valueid'], json_hash['_valueid']) unless json_hash['valueid'].nil?      
      result['valuestring'] = PrimitiveString.transform_json(json_hash['valuestring'], json_hash['_valuestring']) unless json_hash['valuestring'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      
      result['valueinteger'] = PrimitiveInteger.transform_json(json_hash['valueinteger'], json_hash['_valueinteger']) unless json_hash['valueinteger'].nil?      
      result['valuedecimal'] = PrimitiveDecimal.transform_json(json_hash['valuedecimal'], json_hash['_valuedecimal']) unless json_hash['valuedecimal'].nil?      

      result
    end
  end
end
