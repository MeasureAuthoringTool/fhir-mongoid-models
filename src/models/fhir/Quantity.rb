module FHIR
  class Quantity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Quantity'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    embeds_one :comparator, class_name: 'QuantityComparator'
    field :unit, type:  # primitive
    embeds_one :_unit, class_name: 'Extension'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
  end
end
