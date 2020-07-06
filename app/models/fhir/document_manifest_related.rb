module FHIR
  # fhir/document_manifest_related.rb
  class DocumentManifestRelated < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :ref, class_name: 'Reference'

    def self.transform_json(json_hash, target = DocumentManifestRelated.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['ref'] = Reference.transform_json(json_hash['ref']) unless json_hash['ref'].nil?      

      result
    end
  end
end
