module FHIR
  class PaymentReconciliationProcessNote < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PaymentReconciliationProcessNote'
    embeds_one :type, class_name: 'NoteType'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
  end
end
