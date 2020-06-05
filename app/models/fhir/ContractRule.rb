module FHIR
  class ContractRule < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractRule'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'
  end
end
