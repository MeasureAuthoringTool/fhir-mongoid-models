module FHIR
  # fhir/capability_statement_implementation.rb
  class CapabilityStatementImplementation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementImplementation'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :url, class_name: 'PrimitiveUrl'
    embeds_one :custodian, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = CapabilityStatementImplementation.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?      

      result
    end
  end
end
