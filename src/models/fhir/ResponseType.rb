module FHIR
  class ResponseType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResponseType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
