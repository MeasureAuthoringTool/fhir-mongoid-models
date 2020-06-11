module FHIR
  class Binary < Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'Binary'
    embeds_one :contentType, class_name: 'MimeType'
    embeds_one :securityContext, class_name: 'Reference'
    field :data, type:  # primitive
    embeds_one :_data, class_name: 'Extension'
  end
end
