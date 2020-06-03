module FHIR
  class PrimitiveTime < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveTime'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
