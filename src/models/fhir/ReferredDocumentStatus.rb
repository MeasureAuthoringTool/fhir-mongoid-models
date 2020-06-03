module FHIR
  class ReferredDocumentStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ReferredDocumentStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
