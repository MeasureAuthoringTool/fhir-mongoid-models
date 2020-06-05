module FHIR
  class ImplementationGuideDefinitionParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionParameter'
    embeds_one :code, class_name: 'GuideParameterCode'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
