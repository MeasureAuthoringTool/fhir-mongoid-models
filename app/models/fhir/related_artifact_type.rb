module FHIR
  # fhir/related_artifact_type.rb
  class RelatedArtifactType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RelatedArtifactType'
    field :value, type: String

    def self.transform_json(json_hash, target=RelatedArtifactType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
