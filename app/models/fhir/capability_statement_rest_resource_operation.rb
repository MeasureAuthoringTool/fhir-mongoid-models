module FHIR
  # fhir/capability_statement_rest_resource_operation.rb
  class CapabilityStatementRestResourceOperation < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :definition, class_name: 'PrimitiveCanonical'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash, target = CapabilityStatementRestResourceOperation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
