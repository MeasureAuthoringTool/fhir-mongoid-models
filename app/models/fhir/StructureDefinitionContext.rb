module FHIR
  class StructureDefinitionContext < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionContext'
    embeds_one :type, class_name: 'ExtensionContextType'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
  end
end
