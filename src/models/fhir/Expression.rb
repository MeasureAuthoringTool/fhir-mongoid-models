module FHIR
  class Expression < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Expression'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :language, type:  # primitive
    embeds_one :_language, class_name: 'Extension'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
    field :reference, type:  # primitive
    embeds_one :_reference, class_name: 'Extension'
  end
end
