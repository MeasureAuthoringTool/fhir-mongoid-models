module FHIR
  class PrimitiveUri < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveUri'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
