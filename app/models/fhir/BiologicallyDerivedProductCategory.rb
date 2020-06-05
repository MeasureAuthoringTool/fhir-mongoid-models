module FHIR
  class BiologicallyDerivedProductCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductCategory'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
