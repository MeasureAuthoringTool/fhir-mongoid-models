module FHIR
  class MessageSignificanceCategory < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageSignificanceCategory'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
