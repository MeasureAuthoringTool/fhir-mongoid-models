module FHIR
  class SimpleQuantity < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'SimpleQuantity'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    field :unit, type:  # primitive
    embeds_one :_unit, class_name: 'Extension'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
  end
end
