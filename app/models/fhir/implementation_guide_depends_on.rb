module FHIR
  # fhir/implementation_guide_depends_on.rb
  class ImplementationGuideDependsOn < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDependsOn'
    embeds_one :uri, class_name: 'PrimitiveCanonical'
    embeds_one :packageId, class_name: 'PrimitiveId'
    embeds_one :version, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ImplementationGuideDependsOn.new
      result['uri'] = PrimitiveCanonical.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?      
      result['packageId'] = PrimitiveId.transform_json(json_hash['packageId'], json_hash['_packageId']) unless json_hash['packageId'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      

      result
    end
  end
end
