module FHIR
  class OperationDefinitionParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinitionParameter'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :use, class_name: 'OperationParameterUse'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    embeds_one :type, class_name: 'FHIRAllTypes'
    field :targetProfile, type: Array # primitive
    embeds_many :_targetProfile, class_name: 'Extension'
    embeds_one :searchType, class_name: 'SearchParamType'
    embeds_one :binding, class_name: 'OperationDefinitionParameterBinding'
    embeds_many :referencedFrom, class_name: 'OperationDefinitionParameterReferencedFrom'
    embeds_many :part, class_name: 'OperationDefinitionParameter'
  end
end
