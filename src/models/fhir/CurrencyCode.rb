module FHIR
  class CurrencyCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CurrencyCode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
