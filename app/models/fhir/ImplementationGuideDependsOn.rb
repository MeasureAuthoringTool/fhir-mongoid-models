module FHIR
  class ImplementationGuideDependsOn < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDependsOn'
    field :uri, type:  # primitive
    embeds_one :_uri, class_name: 'Extension'
    field :packageId, type:  # primitive
    embeds_one :_packageId, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
  end
end
