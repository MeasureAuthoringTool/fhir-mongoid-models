module FHIR
  # fhir/structure_definition_mapping.rb
  class StructureDefinitionMapping < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionMapping'
    embeds_one :identity, class_name: 'PrimitiveId'
    embeds_one :uri, class_name: 'PrimitiveUri'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :comment, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = StructureDefinitionMapping.new
      result['identity'] = PrimitiveId.transform_json(json_hash['identity'], json_hash['_identity']) unless json_hash['identity'].nil?      
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?      
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
