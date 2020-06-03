module FHIR
  class AssertionOperatorType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AssertionOperatorType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
