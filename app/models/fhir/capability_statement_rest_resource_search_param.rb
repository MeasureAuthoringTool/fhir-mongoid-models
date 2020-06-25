module FHIR
  # fhir/capability_statement_rest_resource_search_param.rb
  class CapabilityStatementRestResourceSearchParam < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestResourceSearchParam'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :definition, class_name: 'PrimitiveCanonical'
    embeds_one :type, class_name: 'SearchParamType'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = CapabilityStatementRestResourceSearchParam.new
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['type'] = SearchParamType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
