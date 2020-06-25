module FHIR
  # fhir/structure_map_group_rule.rb
  class StructureMapGroupRule < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRule'
    embeds_one :name, class_name: 'PrimitiveId'
    embeds_many :source, class_name: 'StructureMapGroupRuleSource'
    embeds_many :target, class_name: 'StructureMapGroupRuleTarget'
    embeds_many :rule, class_name: 'StructureMapGroupRule'
    embeds_many :dependent, class_name: 'StructureMapGroupRuleDependent'
    embeds_one :documentation, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = StructureMapGroupRule.new
      result['name'] = PrimitiveId.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['source'] = json_hash['source'].map { |var| StructureMapGroupRuleSource.transform_json(var) } unless json_hash['source'].nil?
      result['target'] = json_hash['target'].map { |var| StructureMapGroupRuleTarget.transform_json(var) } unless json_hash['target'].nil?
      result['rule'] = json_hash['rule'].map { |var| StructureMapGroupRule.transform_json(var) } unless json_hash['rule'].nil?
      result['dependent'] = json_hash['dependent'].map { |var| StructureMapGroupRuleDependent.transform_json(var) } unless json_hash['dependent'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
