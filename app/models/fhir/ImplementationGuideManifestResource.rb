module FHIR
  class ImplementationGuideManifestResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideManifestResource'
    embeds_one :reference, class_name: 'Reference'
    field :examplePrimitiveBoolean, type:  # primitive
    embeds_one :_examplePrimitiveBoolean, class_name: 'Extension'
    field :examplePrimitiveCanonical, type:  # primitive
    embeds_one :_examplePrimitiveCanonical, class_name: 'Extension'
    field :relativePath, type:  # primitive
    embeds_one :_relativePath, class_name: 'Extension'
  end
end
