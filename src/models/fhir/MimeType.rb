module FHIR
  class MimeType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MimeType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
