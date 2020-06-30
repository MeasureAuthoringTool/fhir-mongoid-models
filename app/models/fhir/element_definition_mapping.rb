module FHIR
  # fhir/element_definition_mapping.rb
  class ElementDefinitionMapping < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionMapping'
    embeds_one :identity, class_name: 'PrimitiveId'
    embeds_one :language, class_name: 'MimeType'
    embeds_one :map, class_name: 'PrimitiveString'
    embeds_one :comment, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=ElementDefinitionMapping.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identity'] = PrimitiveId.transform_json(json_hash['identity'], json_hash['_identity']) unless json_hash['identity'].nil?      
      result['language'] = MimeType.transform_json(json_hash['language']) unless json_hash['language'].nil?      
      result['map'] = PrimitiveString.transform_json(json_hash['map'], json_hash['_map']) unless json_hash['map'].nil?      
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      

      result
    end
  end
end
