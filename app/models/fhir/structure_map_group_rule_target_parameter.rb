module FHIR
  # fhir/structure_map_group_rule_target_parameter.rb
  class StructureMapGroupRuleTargetParameter < BackboneElement
    include Mongoid::Document
    embeds_one :valueId, class_name: 'FHIR::PrimitiveId'
    embeds_one :valueString, class_name: 'FHIR::PrimitiveString'
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :valueInteger, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :valueDecimal, class_name: 'FHIR::PrimitiveDecimal'

    def self.transform_json(json_hash, target = StructureMapGroupRuleTargetParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['valueId'] = PrimitiveId.transform_json(json_hash['valueId'], json_hash['_valueId']) unless json_hash['valueId'].nil?      
      result['valueString'] = PrimitiveString.transform_json(json_hash['valueString'], json_hash['_valueString']) unless json_hash['valueString'].nil?      
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?      
      result['valueInteger'] = PrimitiveInteger.transform_json(json_hash['valueInteger'], json_hash['_valueInteger']) unless json_hash['valueInteger'].nil?      
      result['valueDecimal'] = PrimitiveDecimal.transform_json(json_hash['valueDecimal'], json_hash['_valueDecimal']) unless json_hash['valueDecimal'].nil?      

      result
    end
  end
end
