module FHIR
  # fhir/capability_statement_rest_interaction.rb
  class CapabilityStatementRestInteraction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestInteraction'
    embeds_one :code, class_name: 'SystemRestfulInteraction'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = CapabilityStatementRestInteraction.new
      result['code'] = SystemRestfulInteraction.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      

      result
    end
  end
end
