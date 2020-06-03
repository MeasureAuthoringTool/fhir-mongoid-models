module FHIR
  class InvoiceStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'InvoiceStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
