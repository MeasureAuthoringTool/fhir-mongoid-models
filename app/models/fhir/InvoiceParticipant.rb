module FHIR
  class InvoiceParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InvoiceParticipant'
    embeds_one :role, class_name: 'CodeableConcept'
    embeds_one :actor, class_name: 'Reference'
  end
end
