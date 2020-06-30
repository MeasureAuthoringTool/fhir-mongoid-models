module FHIR
  # fhir/element_definition_base.rb
  class ElementDefinitionBase < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionBase'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :min, class_name: 'PrimitiveUnsignedInt'
    embeds_one :max, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=ElementDefinitionBase.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['min'] = PrimitiveUnsignedInt.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      

      result
    end
  end
end
