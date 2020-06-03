module FHIR
  class CommunicationPayload < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationPayload'
    field :contentPrimitiveString, type:  # primitive
    embeds_one :_contentPrimitiveString, class_name: 'Extension'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'
  end
end
