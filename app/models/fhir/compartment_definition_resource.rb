module FHIR
  # fhir/compartment_definition_resource.rb
  class CompartmentDefinitionResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentDefinitionResource'
    embeds_one :code, class_name: 'ResourceType'
    embeds_many :param, class_name: 'PrimitiveString'
    embeds_one :documentation, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=CompartmentDefinitionResource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = ResourceType.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['param'] = json_hash['param'].each_with_index.map do |var, i|
        extension_hash = json_hash['_param'] && json_hash['_param'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['param'].nil?
      result['documentation'] = PrimitiveString.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
