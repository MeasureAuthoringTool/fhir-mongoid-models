module FHIR
  class RelatedArtifactType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RelatedArtifactType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
