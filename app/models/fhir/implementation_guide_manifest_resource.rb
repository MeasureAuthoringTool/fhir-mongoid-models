module FHIR
  # fhir/implementation_guide_manifest_resource.rb
  class ImplementationGuideManifestResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideManifestResource'
    embeds_one :reference, class_name: 'Reference'
    embeds_one :exampleboolean, class_name: 'PrimitiveBoolean'
    embeds_one :examplecanonical, class_name: 'PrimitiveCanonical'
    embeds_one :relativePath, class_name: 'PrimitiveUrl'

    def self.transform_json(json_hash)
      result = ImplementationGuideManifestResource.new
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      
      result['exampleboolean'] = PrimitiveBoolean.transform_json(json_hash['exampleboolean'], json_hash['_exampleboolean']) unless json_hash['exampleboolean'].nil?      
      result['examplecanonical'] = PrimitiveCanonical.transform_json(json_hash['examplecanonical'], json_hash['_examplecanonical']) unless json_hash['examplecanonical'].nil?      
      result['relativePath'] = PrimitiveUrl.transform_json(json_hash['relativePath'], json_hash['_relativePath']) unless json_hash['relativePath'].nil?      

      result
    end
  end
end
