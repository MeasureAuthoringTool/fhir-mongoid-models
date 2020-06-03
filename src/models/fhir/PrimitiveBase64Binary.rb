module FHIR
  class PrimitiveBase64Binary < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveBase64Binary'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
