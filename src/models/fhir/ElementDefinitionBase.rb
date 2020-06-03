module FHIR
  class ElementDefinitionBase < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionBase'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
  end
end
