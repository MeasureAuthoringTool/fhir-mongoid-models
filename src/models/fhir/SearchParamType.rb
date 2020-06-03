module FHIR
  class SearchParamType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchParamType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
