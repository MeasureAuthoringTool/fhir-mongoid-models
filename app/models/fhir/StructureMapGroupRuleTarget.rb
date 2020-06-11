module FHIR
  class StructureMapGroupRuleTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRuleTarget'
    field :context, type:  # primitive
    embeds_one :_context, class_name: 'Extension'
    embeds_one :contextType, class_name: 'StructureMapContextType'
    field :element, type:  # primitive
    embeds_one :_element, class_name: 'Extension'
    field :variable, type:  # primitive
    embeds_one :_variable, class_name: 'Extension'
    embeds_many :listMode, class_name: 'StructureMapTargetListMode'
    field :listRuleId, type:  # primitive
    embeds_one :_listRuleId, class_name: 'Extension'
    embeds_one :transform, class_name: 'StructureMapTransform'
    embeds_many :parameter, class_name: 'StructureMapGroupRuleTargetParameter'
  end
end
