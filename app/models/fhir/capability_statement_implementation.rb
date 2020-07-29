module FHIR
  # fhir/capability_statement_implementation.rb
  class CapabilityStatementImplementation < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :custodian, class_name: 'FHIR::Reference'    

    def self.transform_json(json_hash, target = CapabilityStatementImplementation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['custodian'] = Reference.transform_json(json_hash['custodian']) unless json_hash['custodian'].nil?

      result
    end
  end
end
