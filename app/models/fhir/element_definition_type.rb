module FHIR
  # fhir/element_definition_type.rb
  class ElementDefinitionType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionType'
    embeds_one :code, class_name: 'PrimitiveUri'
    embeds_many :targetProfile, class_name: 'PrimitiveCanonical'
    embeds_one :versioning, class_name: 'ReferenceVersionRules'

    def self.transform_json(json_hash)
      result = ElementDefinitionType.new
      result['code'] = PrimitiveUri.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['targetProfile'] = json_hash['targetProfile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_targetProfile'] && json_hash['_targetProfile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['targetProfile'].nil?
      result['versioning'] = ReferenceVersionRules.transform_json(json_hash['versioning']) unless json_hash['versioning'].nil?      

      result
    end
  end
end
