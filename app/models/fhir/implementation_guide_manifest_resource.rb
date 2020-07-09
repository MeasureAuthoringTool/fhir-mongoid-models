module FHIR
  # fhir/implementation_guide_manifest_resource.rb
  class ImplementationGuideManifestResource < BackboneElement
    include Mongoid::Document
    embeds_one :reference, class_name: 'FHIR::Reference'
    embeds_one :exampleBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :exampleCanonical, class_name: 'FHIR::PrimitiveCanonical'
    embeds_one :relativePath, class_name: 'FHIR::PrimitiveUrl'

    def self.transform_json(json_hash, target = ImplementationGuideManifestResource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      
      result['exampleBoolean'] = PrimitiveBoolean.transform_json(json_hash['exampleBoolean'], json_hash['_exampleBoolean']) unless json_hash['exampleBoolean'].nil?      
      result['exampleCanonical'] = PrimitiveCanonical.transform_json(json_hash['exampleCanonical'], json_hash['_exampleCanonical']) unless json_hash['exampleCanonical'].nil?      
      result['relativePath'] = PrimitiveUrl.transform_json(json_hash['relativePath'], json_hash['_relativePath']) unless json_hash['relativePath'].nil?      

      result
    end
  end
end
