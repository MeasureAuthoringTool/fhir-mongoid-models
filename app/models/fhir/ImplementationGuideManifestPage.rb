module FHIR
  class ImplementationGuideManifestPage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideManifestPage'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :anchor, type: Array # primitive
    embeds_many :_anchor, class_name: 'Extension'
  end
end
