module FHIR
  class PrimitiveDateTime < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveDateTime'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
