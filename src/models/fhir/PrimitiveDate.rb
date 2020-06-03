module FHIR
  class PrimitiveDate < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveDate'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
