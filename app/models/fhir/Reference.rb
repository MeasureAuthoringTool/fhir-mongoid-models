module FHIR
  class Reference < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Reference'
    field :reference, type:  # primitive
    embeds_one :_reference, class_name: 'Extension'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    embeds_one :identifier, class_name: 'Identifier'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
  end
end
