module FHIR
  class ContractLegal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractLegal'
    embeds_one :contentAttachment, class_name: 'Attachment'
    embeds_one :contentReference, class_name: 'Reference'
  end
end
