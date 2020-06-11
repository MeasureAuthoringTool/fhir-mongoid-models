module FHIR
  class RelatedArtifact < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RelatedArtifact'
    embeds_one :type, class_name: 'RelatedArtifactType'
    field :label, type:  # primitive
    embeds_one :_label, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
    field :citation, type:  # primitive
    embeds_one :_citation, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_one :document, class_name: 'Attachment'
    field :resource, type:  # primitive
    embeds_one :_resource, class_name: 'Extension'
  end
end
