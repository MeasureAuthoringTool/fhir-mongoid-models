module FHIR
  class ImplementationGuideDefinitionPage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionPage'
    field :namePrimitiveUrl, type:  # primitive
    embeds_one :_namePrimitiveUrl, class_name: 'Extension'
    embeds_one :nameReference, class_name: 'Reference'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    embeds_one :generation, class_name: 'GuidePageGeneration'
    embeds_many :page, class_name: 'ImplementationGuideDefinitionPage'
  end
end
