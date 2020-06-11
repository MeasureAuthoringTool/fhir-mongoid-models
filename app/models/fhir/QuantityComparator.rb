module FHIR
  class QuantityComparator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuantityComparator'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
