module FHIR
  class ImplementationGuideDefinition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinition'
    embeds_many :grouping, class_name: 'ImplementationGuideDefinitionGrouping'
    embeds_many :resource, class_name: 'ImplementationGuideDefinitionResource'
    embeds_one :page, class_name: 'ImplementationGuideDefinitionPage'
    embeds_many :parameter, class_name: 'ImplementationGuideDefinitionParameter'
    embeds_many :template, class_name: 'ImplementationGuideDefinitionTemplate'
  end
end
