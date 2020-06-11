module FHIR
  class DocumentReferenceContent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentReferenceContent'
    embeds_one :attachment, class_name: 'Attachment'
    embeds_one :format, class_name: 'Coding'
  end
end
