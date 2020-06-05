module FHIR
  class FilterOperator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FilterOperator'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
