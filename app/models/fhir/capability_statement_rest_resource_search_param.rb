module FHIR
  # fhir/capability_statement_rest_resource_search_param.rb
  class CapabilityStatementRestResourceSearchParam < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :type, class_name: 'FHIR::SearchParamType'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveMarkdown'    

    def self.transform_json(json_hash, target = CapabilityStatementRestResourceSearchParam.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?
      result['type'] = SearchParamType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
