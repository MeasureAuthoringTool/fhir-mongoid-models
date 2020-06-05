module FHIR
  class ElementDefinitionBinding < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionBinding'
    embeds_one :strength, class_name: 'BindingStrength'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :valueSet, type:  # primitive
    embeds_one :_valueSet, class_name: 'Extension'
  end
end
