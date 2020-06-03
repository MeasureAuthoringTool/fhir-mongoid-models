module FHIR
  class ListStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ListStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
