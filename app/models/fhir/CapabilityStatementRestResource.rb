module FHIR
  class CapabilityStatementRestResource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestResource'
    embeds_one :type, class_name: 'ResourceType'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
    field :supportedProfile, type: Array # primitive
    embeds_many :_supportedProfile, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    embeds_many :interaction, class_name: 'CapabilityStatementRestResourceInteraction'
    embeds_one :versioning, class_name: 'ResourceVersionPolicy'
    field :readHistory, type:  # primitive
    embeds_one :_readHistory, class_name: 'Extension'
    field :updateCreate, type:  # primitive
    embeds_one :_updateCreate, class_name: 'Extension'
    field :conditionalCreate, type:  # primitive
    embeds_one :_conditionalCreate, class_name: 'Extension'
    embeds_one :conditionalRead, class_name: 'ConditionalReadStatus'
    field :conditionalUpdate, type:  # primitive
    embeds_one :_conditionalUpdate, class_name: 'Extension'
    embeds_one :conditionalDelete, class_name: 'ConditionalDeleteStatus'
    embeds_many :referencePolicy, class_name: 'ReferenceHandlingPolicy'
    field :searchInclude, type: Array # primitive
    embeds_many :_searchInclude, class_name: 'Extension'
    field :searchRevInclude, type: Array # primitive
    embeds_many :_searchRevInclude, class_name: 'Extension'
    embeds_many :searchParam, class_name: 'CapabilityStatementRestResourceSearchParam'
    embeds_many :operation, class_name: 'CapabilityStatementRestResourceOperation'
  end
end
