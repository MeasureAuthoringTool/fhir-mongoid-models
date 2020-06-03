module FHIR
  class SearchParameterComponent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchParameterComponent'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
  end
end
