module FHIR
  class BiologicallyDerivedProductStorageScale < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductStorageScale'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
