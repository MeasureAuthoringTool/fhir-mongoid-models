module FHIR
  class PrimitiveInteger < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveInteger'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
