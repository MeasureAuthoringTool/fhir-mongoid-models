module FHIR
  # fhir/capability_statement_rest_resource_interaction.rb
  class CapabilityStatementRestResourceInteraction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestResourceInteraction'
    embeds_one :code, class_name: 'TypeRestfulInteraction'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = CapabilityStatementRestResourceInteraction.new
      result['code'] = TypeRestfulInteraction.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
