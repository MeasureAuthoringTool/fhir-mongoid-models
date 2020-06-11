module FHIR
  class Annotation < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Annotation'
    embeds_one :authorReference, class_name: 'Reference'
    field :authorPrimitiveString, type:  # primitive
    embeds_one :_authorPrimitiveString, class_name: 'Extension'
    field :time, type:  # primitive
    embeds_one :_time, class_name: 'Extension'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
  end
end
