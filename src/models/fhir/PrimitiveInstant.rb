module FHIR
  class PrimitiveInstant < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveInstant'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
