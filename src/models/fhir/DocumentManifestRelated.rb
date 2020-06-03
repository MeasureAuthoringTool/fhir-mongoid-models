module FHIR
  class DocumentManifestRelated < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentManifestRelated'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :ref, class_name: 'Reference'
  end
end
