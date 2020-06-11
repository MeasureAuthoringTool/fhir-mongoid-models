module FHIR
  class PrimitiveMarkdown < string
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveMarkdown'
  end
end
