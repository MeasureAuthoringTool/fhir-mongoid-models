module FHIR
  class StructureMapGroupRule < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureMapGroupRule'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_many :source, class_name: 'StructureMapGroupRuleSource'
    embeds_many :target, class_name: 'StructureMapGroupRuleTarget'
    embeds_many :rule, class_name: 'StructureMapGroupRule'
    embeds_many :dependent, class_name: 'StructureMapGroupRuleDependent'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
