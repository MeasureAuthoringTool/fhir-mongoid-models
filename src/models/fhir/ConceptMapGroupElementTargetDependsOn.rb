module FHIR
  class ConceptMapGroupElementTargetDependsOn < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapGroupElementTargetDependsOn'
    field :property, type:  # primitive
    embeds_one :_property, class_name: 'Extension'
    field :system, type:  # primitive
    embeds_one :_system, class_name: 'Extension'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    field :display, type:  # primitive
    embeds_one :_display, class_name: 'Extension'
  end
end
