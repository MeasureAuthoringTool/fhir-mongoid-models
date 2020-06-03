module FHIR
  class ImplementationGuideDefinitionTemplate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionTemplate'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
    field :scope, type:  # primitive
    embeds_one :_scope, class_name: 'Extension'
  end
end
