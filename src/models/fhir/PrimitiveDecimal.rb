module FHIR
  class PrimitiveDecimal < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveDecimal'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
