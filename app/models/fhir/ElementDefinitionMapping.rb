module FHIR
  class ElementDefinitionMapping < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionMapping'
    field :identity, type:  # primitive
    embeds_one :_identity, class_name: 'Extension'
    embeds_one :language, class_name: 'MimeType'
    field :map, type:  # primitive
    embeds_one :_map, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
