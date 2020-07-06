module FHIR
  # fhir/structure_map_group_rule_dependent.rb
  class StructureMapGroupRuleDependent < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveId'
    embeds_many :variable, class_name: 'PrimitiveString'

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
