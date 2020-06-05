module FHIR
  class OperationDefinitionParameterReferencedFrom < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinitionParameterReferencedFrom'
    field :source, type:  # primitive
    embeds_one :_source, class_name: 'Extension'
    field :sourceId, type:  # primitive
    embeds_one :_sourceId, class_name: 'Extension'
  end
end
