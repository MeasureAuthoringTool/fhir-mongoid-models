module FHIR
  class BiologicallyDerivedProductStorage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BiologicallyDerivedProductStorage'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :temperature, type:  # primitive
    embeds_one :_temperature, class_name: 'Extension'
    embeds_one :scale, class_name: 'BiologicallyDerivedProductStorageScale'
    embeds_one :duration, class_name: 'Period'
  end
end
