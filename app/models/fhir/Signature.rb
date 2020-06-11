module FHIR
  class Signature < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Signature'
    embeds_many :type, class_name: 'Coding'
    field :when, type:  # primitive
    embeds_one :_when, class_name: 'Extension'
    embeds_one :who, class_name: 'Reference'
    embeds_one :onBehalfOf, class_name: 'Reference'
    embeds_one :targetFormat, class_name: 'MimeType'
    embeds_one :sigFormat, class_name: 'MimeType'
    field :data, type:  # primitive
    embeds_one :_data, class_name: 'Extension'
  end
end
