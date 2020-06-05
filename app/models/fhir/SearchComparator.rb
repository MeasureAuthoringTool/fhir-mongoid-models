module FHIR
  class SearchComparator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchComparator'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
