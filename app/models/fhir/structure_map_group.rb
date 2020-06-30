module FHIR
  # fhir/structure_map_group.rb
  class StructureMapGroup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroup'
    embeds_one :name, class_name: 'PrimitiveId'
    embeds_one :extends, class_name: 'PrimitiveId'
    embeds_one :typeMode, class_name: 'StructureMapGroupTypeMode'
    embeds_one :documentation, class_name: 'PrimitiveString'
    embeds_many :input, class_name: 'StructureMapGroupInput'
    embeds_many :rule, class_name: 'StructureMapGroupRule'

    def self.transform_json(json_hash, target=StructureMapGroup.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveId.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['extends'] = PrimitiveId.transform_json(json_hash['extends'], json_hash['_extends']) unless json_hash['extends'].nil?      
      result['typeMode'] = StructureMapGroupTypeMode.transform_json(json_hash['typeMode']) unless json_hash['typeMode'].nil?      
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      
      result['input'] = json_hash['input'].map { |var| StructureMapGroupInput.transform_json(var) } unless json_hash['input'].nil?
      result['rule'] = json_hash['rule'].map { |var| StructureMapGroupRule.transform_json(var) } unless json_hash['rule'].nil?

      result
    end
  end
end
