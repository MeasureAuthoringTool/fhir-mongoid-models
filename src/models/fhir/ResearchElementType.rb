module FHIR
  class ResearchElementType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchElementType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
