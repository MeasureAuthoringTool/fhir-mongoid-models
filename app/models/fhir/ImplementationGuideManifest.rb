module FHIR
  class ImplementationGuideManifest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideManifest'
    field :rendering, type:  # primitive
    embeds_one :_rendering, class_name: 'Extension'
    embeds_many :resource, class_name: 'ImplementationGuideManifestResource'
    embeds_many :page, class_name: 'ImplementationGuideManifestPage'
    field :image, type: Array # primitive
    embeds_many :_image, class_name: 'Extension'
    field :other, type: Array # primitive
    embeds_many :_other, class_name: 'Extension'
  end
end
