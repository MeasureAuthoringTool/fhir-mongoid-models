module FHIR
  class Attachment < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Attachment'
    embeds_one :contentType, class_name: 'MimeType'
    field :language, type:  # primitive
    embeds_one :_language, class_name: 'Extension'
    field :data, type:  # primitive
    embeds_one :_data, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :size, type:  # primitive
    embeds_one :_size, class_name: 'Extension'
    field :hash, type:  # primitive
    embeds_one :_hash, class_name: 'Extension'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :creation, type:  # primitive
    embeds_one :_creation, class_name: 'Extension'
  end
end
