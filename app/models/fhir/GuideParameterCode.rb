module FHIR
  class GuideParameterCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GuideParameterCode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
