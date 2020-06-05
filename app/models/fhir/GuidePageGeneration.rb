module FHIR
  class GuidePageGeneration < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GuidePageGeneration'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
