module FHIR
  class SearchEntryMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchEntryMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
