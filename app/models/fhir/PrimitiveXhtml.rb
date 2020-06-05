module FHIR
  class PrimitiveXhtml < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveXhtml'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
