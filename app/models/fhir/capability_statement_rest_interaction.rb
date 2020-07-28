module FHIR
  # fhir/capability_statement_rest_interaction.rb
  class CapabilityStatementRestInteraction < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::SystemRestfulInteraction'    
    embeds_one :documentation, class_name: 'FHIR::PrimitiveMarkdown'    

    def self.transform_json(json_hash, target = CapabilityStatementRestInteraction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = SystemRestfulInteraction.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?

      result
    end
  end
end
