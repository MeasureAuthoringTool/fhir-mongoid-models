module FHIR
  class Money < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Money'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    embeds_one :currency, class_name: 'CurrencyCode'
  end
end
