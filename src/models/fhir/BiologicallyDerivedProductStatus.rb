module FHIR
  class BiologicallyDerivedProductStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
