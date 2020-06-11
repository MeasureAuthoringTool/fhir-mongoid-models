module FHIR
  class SortDirection < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SortDirection'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
