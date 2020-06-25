module FHIR
  # fhir/terminology_capabilities_implementation.rb
  class TerminologyCapabilitiesImplementation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesImplementation'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :url, class_name: 'PrimitiveUrl'

    def self.transform_json(json_hash)
      result = TerminologyCapabilitiesImplementation.new
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['url'] = PrimitiveUrl.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      

      result
    end
  end
end
