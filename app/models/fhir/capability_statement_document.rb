module FHIR
  # fhir/capability_statement_document.rb
  class CapabilityStatementDocument < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementDocument'
    embeds_one :mode, class_name: 'DocumentMode'
    embeds_one :documentation, class_name: 'PrimitiveMarkdown'
    embeds_one :profile, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash, target=CapabilityStatementDocument.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = DocumentMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['documentation'] = PrimitiveMarkdown.transform_json(json_hash['documentation'], json_hash['_documentation']) unless json_hash['documentation'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      

      result
    end
  end
end
